package com.lookbackon.AI.steeringBehavior.behaviors
{
	import com.lookbackon.AI.steeringBehavior.Vehicle;

	/**
	 * 
	 * @author Knight.zhou
	 * 
	 */
	public interface IPursue
	{
		function pursue(target:Vehicle):void;
	}
}