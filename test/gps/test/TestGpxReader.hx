package gps.test;
import gps.io.gpx.Reader;
import sys.io.File;
import utest.Assert;

/**
 * ...
 * @author waneck
 */

class TestGpxReader 
{
	public function new() 
	{
		
	}
	
	public function testRead()
	{
		var r = new Reader( DateTools.hours(-2) );
		var route = r.read( File.read( "../assets/testData.gpx", false) );
		
		Assert.floatEquals( -15.840326, route[0].lat );
		Assert.floatEquals( -47.932247, route[0].lon );
		Assert.equals( "2012-12-10 05:35:25", route[0].date.toString() );
		Assert.floatEquals( 0.100000, route[0].speed );
		Assert.equals( 2746, route.length );
	}
	
}