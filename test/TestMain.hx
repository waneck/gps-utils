package ;

import gps.test.TestGpxReader;
import neko.Lib;
import utest.Runner;
import utest.ui.Report;

/**
 * ...
 * @author waneck
 */

class TestMain 
{
	
	static function main() 
	{
		var runner = new Runner();
		
		runner.addCase(new TestGpxReader());
		
		Report.create(runner);
		runner.run();
	}
	
}