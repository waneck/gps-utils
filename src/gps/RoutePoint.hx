package gps;

/**
 * ...
 * @author waneck
 */

class RoutePoint extends Position
{
	/**
	 * The timestamp of the read point
	 */
	public var date(default, null):Date;
	
	/**
	 * Current speed, in m/s
	 */
	public var speed(default, null):Null<Float>;
	
	public function new(latitude:Float, longitude:Float, date:Date, ?speed)
	{
		super(latitude, longitude);
		this.date = date;
		this.speed = speed;
	}
	
}