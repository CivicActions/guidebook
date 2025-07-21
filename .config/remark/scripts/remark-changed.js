#!/usr/bin/env node

/**
 * Script to run remark on changed markdown files in the git repository.
 */

import { execSync, spawn } from 'child_process';
import { existsSync } from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * Get the root directory of the git repository.
 */
function getGitRoot() {
  try {
    const result = execSync('git rev-parse --show-toplevel', {
      encoding: 'utf8',
      stdio: ['inherit', 'pipe', 'pipe']
    });
    return result.trim();
  } catch (error) {
    console.error('Error: Not in a git repository');
    process.exit(1);
  }
}

/**
 * Get list of changed markdown files in the git repository.
 */
function getChangedFiles() {
  try {
    // Get staged files
    const stagedResult = execSync('git diff --cached --name-only --diff-filter=ACMR', {
      encoding: 'utf8',
      stdio: ['inherit', 'pipe', 'pipe']
    });

    // Get unstaged files
    const unstagedResult = execSync('git diff --name-only --diff-filter=ACMR', {
      encoding: 'utf8',
      stdio: ['inherit', 'pipe', 'pipe']
    });

    // Combine and deduplicate
    const allFiles = new Set([
      ...stagedResult.trim().split('\n'),
      ...unstagedResult.trim().split('\n')
    ]);

    // Filter for markdown files and remove empty strings
    const mdFiles = Array.from(allFiles).filter(file =>
      file && (file.endsWith('.md') || file.endsWith('.markdown'))
    );

    return mdFiles;
  } catch (error) {
    console.error(`Error getting changed files: ${error.message}`);
    process.exit(1);
  }
}

/**
 * Run a command and return a promise.
 */
function runCommand(command, args, options = {}) {
  return new Promise((resolve, reject) => {
    console.log(`Running: ${command} ${args.join(' ')}`);

    const child = spawn(command, args, {
      stdio: 'inherit',
      ...options
    });

    child.on('close', (code) => {
      if (code === 0) {
        resolve();
      } else {
        reject(new Error(`Command failed with exit code ${code}`));
      }
    });

    child.on('error', (error) => {
      reject(error);
    });
  });
}

/**
 * Run remark on the specified files.
 */
async function runRemark(files, gitRoot) {
  if (!files || files.length === 0) {
    console.log('No changed markdown files found.');
    return;
  }

  // Convert relative paths to absolute paths from git root
  const absFiles = files.map(file => path.resolve(gitRoot, file));

  // Filter out files that don't exist (might have been deleted)
  const existingFiles = absFiles.filter(file => existsSync(file));

  if (existingFiles.length === 0) {
    console.log('No existing markdown files to check.');
    return;
  }

  console.log(`\nChecking ${existingFiles.length} markdown file(s):`);
  existingFiles.forEach(file => {
    console.log(`  - ${path.relative(gitRoot, file)}`);
  });

  const remarkConfigDir = path.resolve(__dirname, '..');

  try {
    // Run remark with problem config
    console.log('\n🔍 Running remark with problem config...');
    await runCommand('yarn', [
      '--cwd', remarkConfigDir,
      'run', 'remark',
      '--rc-path=remarkrc.problem',
      ...existingFiles
    ]);
    console.log('✓ Problem checks completed successfully');

    // Run remark with suggestion config
    console.log('\n💡 Running remark with suggestion config...');
    await runCommand('yarn', [
      '--cwd', remarkConfigDir,
      'run', 'remark',
      '--rc-path=remarkrc.suggestion',
      ...existingFiles
    ]);
    console.log('✓ Suggestion checks completed successfully');

  } catch (error) {
    console.error(`\n❌ Error running remark: ${error.message}`);
    process.exit(1);
  }
}

/**
 * Main entry point for the remark-changed command.
 */
async function main() {
  try {
    const gitRoot = getGitRoot();
    const changedFiles = getChangedFiles();
    await runRemark(changedFiles, gitRoot);
  } catch (error) {
    console.error(`Error: ${error.message}`);
    process.exit(1);
  }
}

// Run the script if called directly
if (import.meta.url === `file://${process.argv[1]}`) {
  main();
}

export { main };
