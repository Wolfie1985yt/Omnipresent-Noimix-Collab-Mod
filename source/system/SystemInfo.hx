package system;
#if windows

import sys.io.Process;

class SystemInfo {
	public static function getTotalRAM()
	{
		Sys.command('${Sys.getCwd()}\\assets\\run_get_total_ram.bat', ['${Sys.getCwd()}\\assets\\run_get_total_ram.bat']);
        var outputFilePath:String = 'assets/shared/data/output.txt';
        var output:String = File.getContent(outputFilePath);
        var trimmedOutput:String = StringTools.trim(output);
        var bom:String = "\uFEFF";
        if (trimmedOutput.indexOf(bom) == 0) {
            trimmedOutput = trimmedOutput.substr(1);
        }
        var totalRAM:Float = Std.parseFloat(trimmedOutput) / (1024 * 1024 * 1024); // Convert from bytes to GB
        if (Math.isNaN(totalRAM)) {
            //trace("Failed to parse total RAM.");
		}
		return totalRAM;
	}
}
#end