//package com.tamirgal
//{
//	import flash.display.GradientType;
//	import flash.display.InterpolationMethod;
//	import flash.display.SpreadMethod;
//	import flash.geom.Matrix;
//	
//	import mx.core.UIComponent;
//
//	public class ButtonFullScreen2 extends UIComponent
//	{
//		public function ButtonFullScreen2()
//		{
//			//TODO: implement function
//			super();
//			
////			this.graphics.beginGradientFill("linear", [0xA0A0A0, 0x505050], [1, 1], [0,0]); 
////			this.graphics.drawRoundRect(0, 0, 20, 20, 10);
//
//			test();
//		}
//		
//		public function test():void
//		{
//			this.graphics.beginFill(0xffffff);
//			this.graphics.drawRect(0, 0, 50, 200);
//			this.graphics.endFill();
//		}
//		
//		public function drawGradientSquare():void
//		{
//			var type:String = GradientType.LINEAR;
//			var colors:Array = [0x5E5F8B, 0x34355A];
//			var alphas:Array = [1, 1];
//			var ratios:Array = [0, 255];
//			var spreadMethod:String = SpreadMethod.PAD;
//			var interp:String = InterpolationMethod.LINEAR_RGB;
//			var focalPtRatio:Number = 0;
//			
//			var matrix:Matrix = new Matrix();
//			var size:Number = 30;
//			var boxWidth:Number = size;
//			var boxHeight:Number = size;
//			var boxRotation:Number = Math.PI/2; // 90�?
//			var tx:Number = 0;
//			var ty:Number = 0;
//			matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty);
//			
//			this.graphics.lineStyle(1, 0x73749D, 1, true);
//			this.graphics.beginGradientFill(type, 
//			                            colors,
//			                            alphas,
//			                            ratios, 
//			                            matrix, 
//			                            spreadMethod, 
//			                            interp, 
//			                            focalPtRatio);
//			this.graphics.drawRoundRect(0, 0, size, size, 7);
//			this.graphics.endFill();
//
//			var baseLine:Number = size/24;
//
//			this.graphics.lineStyle(1, 0xffffff, 1, true);
//			this.graphics.moveTo( baseLine*6, baseLine*6 );
//			this.graphics.lineTo( baseLine*6, baseLine*18);
//			this.graphics.lineTo( baseLine*18, baseLine*18);
//			this.graphics.lineTo( baseLine*18, baseLine*14);
//			this.graphics.moveTo( baseLine*6, baseLine*6 );
//			this.graphics.lineTo( baseLine*10, baseLine*6);
//						
//			this.graphics.beginFill(0xffffff);
//			this.graphics.moveTo( baseLine*18, baseLine*6 );
//			this.graphics.lineTo( baseLine*18, baseLine*10);
//			this.graphics.lineTo( baseLine*14, baseLine*6);
//			this.graphics.lineTo( baseLine*18, baseLine*6);
//			//this.graphics.endFill();
//									
//			this.graphics.moveTo( baseLine*11, baseLine*11 );
//			this.graphics.lineTo( baseLine*13, baseLine*13);
//			this.graphics.lineTo( baseLine*18, baseLine*8);
//			this.graphics.moveTo( baseLine*11, baseLine*11 );
//			this.graphics.lineTo( baseLine*16, baseLine*6);
//			
//			this.graphics.endFill();
//		}
//		
//	}
//}