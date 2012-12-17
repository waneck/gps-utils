package gps.io.gpx;
import gps.RoutePoint;
import haxe.io.Input;
import haxe.xml.Fast;

/**
 * Warning: this is not a complete GPX reader implementation; The full specs will be implemented soon
 * @author waneck
 */

class Reader 
{
	public var timeZoneDelta(default, null):Float;
	
	public function new(timeZoneDelta:Float = 0) 
	{
		this.timeZoneDelta = timeZoneDelta;
	}
	
	public function read(i:Input):Array<gps.RoutePoint>
	{
		var str = i.readAll().toString();
		i.close();
		
		var xmlstr = Xml.parse(str);
		var it = xmlstr.elements().next().firstElement().elements();
		it.next();
		var p = it.next();
		
		var ret = [];
		var x:Fast = new Fast(p);
		for (x in x.elements)
		{
			var x:Fast = x;
			var lat = Std.parseFloat(x.att.lat);
			var lon = Std.parseFloat(x.att.lon);
			var time = x.node.time.innerData;
			var speed = Std.parseFloat(x.node.speed.innerData);
			
			var s = StringTools.replace(time.substr(0, time.length - 1), "T", " ");
			var date = DateTools.delta(Date.fromString(s), timeZoneDelta);
			
			ret.push(new RoutePoint(lat, lon, date, Math.isNaN(speed) ? null : speed));
		}
		
		return ret;
	}
}