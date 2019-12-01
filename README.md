# Win10_TroubleShooter

## Custom made batch command + Powershell troubleshooter for Windows 10

### What does it do?

I was frustrated with finding out there were problems while doing daily, simple tasks on new laptops and desktops with Windows 10 installed to do very simple things. For example, whenever I plug in a USB, copy some files, then attempted to eject the USB, I would get a notification message saying there is a problem preventing the USB from being ejected. 

Before, I would attempt to do a Google search online, read up about how to use Process Explorer, attempt to find the handle or File DLL that is executing or taking hold of a file on the USB, and have to use Task Manager to kill the process, in order to let the USB become ejectable.

But now, with my troubleshooter, I can easily find what program is preventing the ejection of my USB, and just kill it with Task Manager, without having to go fetch Process Explorer every time on new computers.

This troubleshooter aims to ease up some of the frustrations like this, so it is easier to manage without wasting time.

Note that, this troubleshooter is very customizable (if you're very knowledgeable with Powershell and Batch scripting). However, it does not attempt to resolve advanced issues or Windows 10 issues itself. Those are for Microsoft developers to solve, not me as an individual. 

### Instructions

1. Clone the repository.
2. Make sure the `run_troubleshooter.bat` is relative to the `powershell` folder.
3. Make sure all of the Powershell scripts are always in the `powershell` folder.
4. Make sure there is only 1 Batch file outside of `powershell` folder.
5. Run the batch file. Instructions should be displayed in the command prompt.

### FAQ

1. Why is "System" preventing the USB from ejecting/unloading?

    **A**: Check and see if you accidentally copied a file or multiple files within that USB storage media. If so, you have to copy any other file(s) that doesn't belong in the USB storage media, like any of the desktop shortcuts on the Desktop, and then the System will release your USB storage media, allowing you eject it safely.

### Contribution

1. **ALWAYS A REQUIREMENT** - You must add comments (either `REM` in batch scripts or `#` in Powershell) for every section of code you add, delete, or tweak/modify in your pull requests. This helps future contributors (beginners and experts alike) in knowing what the command lines and/or changes are doing. If it's hard to describe it easily, at least give a very high level description of the abstract task.
2. Feel free to fork the code and use it for your own IT stuffs.
3. Pull requests are very welcomed.

### Current Troubleshooting Features

* Finds what program or process is preventing the USB device from being ejected.

### License

MIT License

### Original Author

Thompson Lee (tom_mai78101)