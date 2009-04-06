package com.almirun.common.view
{
	import flash.display.CapsStyle;
	import flash.display.Graphics;
	import flash.display.LineScaleMode;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	import mx.core.UIComponent;
	
	public class ActivitySpinner extends UIComponent
	{
		public function get colour():uint { return _colour; }
		public function set colour(value:uint):void { _colour = value; }
		private var _colour:uint = 0x808080;

		public function get animPeriod():Number { return _animPeriod; }
		public function set animPeriod(value:Number):void {_animPeriod = value;}
		private var _animPeriod:Number = 50;
		
		public function get leafCount():int { return _leafCount; }
		public function set leafCount(value:int):void { _leafCount = value; }
		private var _leafCount:int = 12;
		
		public function get leafLength():Number { return _leafLength; }
		public function set leafLength(value:Number):void { _leafLength = value; }
		private var _leafLength:int = 12;
		
		public function get leafThickness():Number { return _leafThickness; }
		public function set leafThickness(value:Number):void {
			_leafThickness = value; }
		private var _leafThickness:int = 3;
		
		public function get squareDim():Number { return _squareDim; }
		public function set squareDim(value:Number):void { _squareDim = value; }
		private var _squareDim:Number = 40;
		
		public function get trailCount():int { return _trailCount; }
		public function set trailCount(value:int):void { _trailCount = value; }
		private var _trailCount:int = 4;
		
		private var centrePoint:Point;
		private var drawn:Boolean = false;
		private var timer:Timer;
		private var leaves:ArrayCollection;
		
		public function ActivitySpinner()
		{
			centrePoint = new Point(0, 0);
			leaves = new ArrayCollection();
			timer = new Timer(0);
			timer.addEventListener(TimerEvent.TIMER, handleTimer);
		}
		
		public function start():void
		{
			if (!drawn)
			{
				draw();
			}
			
//			timer.reset();
			timer.delay = animPeriod;
			timer.start();
		}
		
		public function stop():void
		{
			timer.stop();
		}
		
		private function draw():void
		{
			var leaf:Sprite;
			var gfx:Graphics;
			
			for (var i:int = 0; i < leafCount; i++)
			{
				leaf = new Sprite();
				gfx = leaf.graphics;
				leaf.x = centrePoint.x;
				leaf.y = centrePoint.y;
				gfx.lineStyle(leafThickness, colour, 1, true,
					LineScaleMode.NORMAL, CapsStyle.ROUND);
				gfx.moveTo((squareDim / 2) - leafLength, 0);
				gfx.lineTo(leafLength, 0);
				leaf.rotation = i * (360 / leafCount);
				leaves.addItem(leaf);
				addChild(leaf);
			}
			
			drawn = true;
		}
		
		private function shadePetals():void
		{
			var currentLeafIdx:int = timer.currentCount % leaves.length;
			var lowAlpha:Number = .2;
			var highAlpha:Number = 1;
			var relPosn:int;
			var diff:int;
			
			for (var i:int = 0; i < leaves.length; i++)
			{
				if (currentLeafIdx < trailCount
						&& i + trailCount > leaves.length)
				{
					relPosn = i - leaves.length;
				}
				else if (currentLeafIdx + trailCount > leaves.length
						&& i < trailCount)
				{
					relPosn = i + leaves.length;
				}
				else
				{
					relPosn = i;
				}
				
				diff = Math.max(relPosn - currentLeafIdx,
					currentLeafIdx - relPosn);
				
				if (diff < trailCount)
				{
					leaves[i].alpha = lowAlpha
						+ ((highAlpha - lowAlpha) *
							((trailCount - diff) / trailCount)); 
				}
				else
				{
					leaves[i].alpha = lowAlpha;
				}
			}
		}
		
		private function handleTimer(event:TimerEvent):void
		{
			shadePetals();
		}
	}
}