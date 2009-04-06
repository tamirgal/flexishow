/*

Buttons.as

Copyright (c) 2009 Tamir Gal, http://www.tamirgal.com, All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice,
        this list of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright 
        notice, this list of conditions and the following disclaimer in 
        the documentation and/or other materials provided with the distribution.

    3. The names of the authors may not be used to endorse or promote products
        derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR
OR ANY CONTRIBUTORS TO THIS SOFTWARE BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.tamirgal
{
	import com.joelconnett.geom.FlexMatrixTransformer;	
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	
	import mx.containers.Canvas;
	import mx.core.Container;
	
	public class Buttons
	{
		public function Buttons()
		{
		}

		public static function getButtonFullScreen(width:Number, height:Number):Container
		{
			return _getButtonFullScreen(width, height, false); 	
		}
				
		public static function getButtonFullScreenOff(width:Number, height:Number):Container
		{
			return _getButtonFullScreen(width, height, true); 	
		}
		
		public static function _getButtonFullScreen(width:Number, height:Number, off:Boolean):Container
		{
			var button:Container = getButtonFullScreenBase(width, height);
			var arrow:Shape = createArrow(width, height);
			button.rawChildren.addChild(arrow);
			if(off)
				rotate(arrow, 180, width/2+width/10, height/2-height/10);
			return button; 	
		}

		private static function getButtonFullScreenBase(width:Number, height:Number):Container
		{
			var button:Container = createBaseButton(width, height);
			var square:Shape = new Shape();
			square.graphics.lineStyle(1, 0xffffff, 1, true);
			square.graphics.drawRect(width/4, height/4, width/2, height/2);
			button.rawChildren.addChild(square);
			
			var mask:Shape = new Shape();
			mask.graphics.beginFill(0xffffff, 1);
			mask.graphics.drawRect(0, 0, width*2/5, height);
			mask.graphics.drawRect(0, height*3/5, width, height*2/5);
			mask.graphics.endFill();
			square.mask = mask;
			button.rawChildren.addChild(mask);
	
			return button;
		}
		
		private static function createBaseButton(width:Number, height:Number):Container
		{
			var button:Canvas = new Canvas();
			button.width = width;
			button.height = height;
			
			var backround:Shape = new Shape();

			var type:String = GradientType.LINEAR;
			var colors:Array = [0x5E5F8B, 0x34355A];
			var alphas:Array = [1, 1];
			var ratios:Array = [0, 255];
			var spreadMethod:String = SpreadMethod.PAD;
			var interp:String = InterpolationMethod.LINEAR_RGB;
			var focalPtRatio:Number = 0;
			
			var matrix:Matrix = new Matrix();
			var boxRotation:Number = Math.PI/2; // 90�?
			var tx:Number = 0;
			var ty:Number = 0;
			
			matrix.createGradientBox(width, height, boxRotation, tx, ty);
			
			backround.graphics.lineStyle(1, 0x73749D, 1, true);
			backround.graphics.beginGradientFill(type, 
			                            colors,
			                            alphas,
			                            ratios, 
			                            matrix, 
			                            spreadMethod, 
			                            interp, 
			                            focalPtRatio);
			backround.graphics.drawRoundRect(0, 0, width, height, 7);
			backround.graphics.endFill();
			
			button.rawChildren.addChild(backround);
			
			return button;
		}
		
		private static function createArrow(width:Number, height:Number):Shape
		{
			var arrow:Shape = new Shape();
			var arrowSize:Number  = width/6;
			arrow.graphics.lineStyle(1, 0xffffff, 1);
			arrow.graphics.beginFill(0xffffff, 1);
			arrow.graphics.moveTo(width*3/4, height/4);
			arrow.graphics.lineTo(width*3/4, height/4+arrowSize);
			arrow.graphics.lineTo(width*3/4-arrowSize, height/4);
			arrow.graphics.lineTo(width*3/4, height/4);
			arrow.graphics.endFill();
			
			arrow.graphics.lineStyle(3, 0xffffff, 1);
			arrow.graphics.moveTo(width/2, height/2);
			arrow.graphics.lineTo(width*3/4-arrowSize/2, height/4+arrowSize/2);
			
			return arrow;			
		}
				
		private static function rotate(shape:Shape, angle:Number, x:Number, y:Number):void
		{
			var m:Matrix = shape.transform.matrix;
			FlexMatrixTransformer.rotateAroundInternalPoint(m, x, y, angle);
			shape.transform.matrix = m;
		}
	}
}