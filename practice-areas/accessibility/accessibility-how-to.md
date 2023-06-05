---
title: Testing guide
---

# How to test the accessibility of our applications

It is worth looking over the [resources on testing on Drupal.org](https://www.drupal.org/docs/accessibility/how-to-do-an-accessibility-review). The following resources are a more consolidated list put in order of priority. They are structured from lowest to greatest effort, and addressing issues in steps 1 and 2 will make screen reader and voice control testing easier:

## 1/ [Accessibility Insights](https://accessibilityinsights.io/) (FastPass)

Microsoft's open source Accessibility Insights offers both the automated testing with axe and guided keyboard only testing within their FastPass. This is roughly equivalent to using WebAim's proprietary [Wave](https://wave.webaim.org/) toolbar with [Keyboard-only testing](https://webaim.org/techniques/keyboard/). The main advantage of Accessibility Insights is that it provides assets which make it easier to include in JIRA to replicate the results.

How to install: [Install Accessibility Insights for the Web](https://accessibilityinsights.io/downloads/) in Edge/Chrome browser.

How to use: [Watch this video about basic use](https://www.youtube.com/watch?v=XVvBJoEe4Is&ab_channel=AccessibilityInsights) of this extension. After you've installed this browser extension and enabled it in your dashboard, click on the icon and then FastPass.

## 2/ [Accessibility Insights](https://accessibilityinsights.io/) (Assessment)

By doing an automated scan and keyboard only testing you will catch most, but not all, accessibility errors. Accessibility Insights Assessments guides you through other steps that should be evaluated when testing new patterns. This will catch issues which may have been skipped if only automated tests have been used historically.

How to test: [Watch this video guidance on using the assessment section](https://www.youtube.com/watch?v=XVvBJoEe4Is&ab_channel=AccessibilityInsights) of this extension.

## 3/ [Screen readers](https://www.sarasoueidan.com/blog/testing-environment-setup/)

Most operating systems have a screen reader built in. One of the most popular for blind users is JAWS, but the expense and customizability presents limitations for users. Most casual accessibility testers will leverage the built-in VoiceOver screen reader on a Mac and the open source [NVDA on Windows](https://www.nvaccess.org/download/) for testing. If using NVDA, consider contributing from your ProDev to support this great open source project. According to a 2021 by [WebAim survey of screen reader users](https://webaim.org/projects/screenreadersurvey9/), ChromeVox and Windows Narrator combined make up less than 1% of use. It is also worth noting that testing on mobile devices is important and that both iOS (VoiceOver) and Android (TalkBack) have built-in screen readers.

It is very difficult for sighted users to understand how a blind person uses a screen reader. You have to essentially forget the visual layout and learn how to navigate the page content with headers, links, and aria-regions. It is also important to observe and learn from the ways blind users navigate through the page. This video demonstrates [How A Screen Reader User Surfs The Web](https://www.youtube.com/watch?v=OUDV1gqs9GA).

How to test: Apple has produced a great quantity of documentation on both the [MacOSX](https://support.apple.com/en-gb/guide/voiceover/welcome/mac) & [iOS](https://support.apple.com/en-gb/guide/iphone/iph3e2e415f/ios) versions of VoiceOver. WebAim also has useful resources for [MacOSX](https://webaim.org/articles/voiceover/) & [iOS](https://webaim.org/articles/voiceover/mobile) versions. Harvard University published this [guide on using NVDA](https://accessibility.huit.harvard.edu/nvda) and [WebAim also has a similar guide](https://webaim.org/articles/nvda/).

Helpful tip: Make sure you know how to turn it off before you turn it on.

## 4/ Voice control

There are a great number of assistive technologies being employed, and more are being added every day. Speech control is becoming increasingly popular to allow people with motor disabilities to interact.

How to test: There are other voice control tools like [Dragon NaturalySpeaking](https://webaim.org/blog/at-experiment-dragon/), but for the time being we recommend testing with [Apple's Voice Control](https://support.apple.com/en-us/HT210539) and [Windows Speech Recognition](https://support.microsoft.com/en-us/windows/windows-speech-recognition-commands-9d25ef36-994d-f367-a81a-a326160128c7#WindowsVersion=Windows_11). As is standard with Apple, all accessibility features, [Voice Control is also available for iOS](https://support.apple.com/en-us/HT210417).

Helpful tip: Look for videos like this one for [iOS Voice Control](https://www.youtube.com/watch?v=eg22JaZWAgs&t=2s&ab_channel=AppleSupport) and [Windows Speech Recognition](https://www.youtube.com/watch?v=s4i-REZeHVg&t=11s&ab_channel=IanDixon).
