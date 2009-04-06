//package com.tamirgal
//{
//	import com.joelconnett.geom.FlexMatrixTransformer;
//	
//	import flash.display.GradientType;
//	import flash.display.InterpolationMethod;
//	import flash.display.Shape;
//	import flash.display.SpreadMethod;
//	import flash.geom.Matrix;
//	
//	import mx.containers.Canvas;
//
//	public class ButtonFullScreen extends Canvas
//	{
//		public function ButtonFullScreen()
//		{
//			//TODO: implement function
//			super();
//			
////			this.graphics.beginGradientFill("linear", [0xA0A0A0, 0x505050], [1, 1], [0,0]); 
////			this.graphics.drawRoundRect(0, 0, 20, 20, 10);
//
//			drawGradientSquare();
//		}
//		
//		public function test():void
//		{
//			this.graphics.beginFill(0xffffff);
//			this.graphics.drawRect(0, 0, 50, 200);
//			this.graphics.endFill();
//			
//			var m:Matrix = transform.matrix;
//			FlexMatrixTransformer.rotateAroundExternalPoint(m, this.width/2, this.height/2, 45);
//			transform.matrix = m;
//		}
//		
//		public function drawGradientSquare():void
//		{
//			var backround:Shape = new Shape();
//			var square:Shape = new Shape();
//			var mask:Shape = new Shape();
//			var square2:Shape = new Shape();
//			var triangle:Shape = new Shape();
//			
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
//			backround.graphics.lineStyle(1, 0x73749D, 1, true);
//			backround.graphics.beginGradientFill(type, 
//			                            colors,
//			                            alphas,
//			                            ratios, 
//			                            matrix, 
//			                            spreadMethod, 
//			                            interp, 
//			                            focalPtRatio);
//			backround.graphics.drawRoundRect(0, 0, size, size, 7);
//			backround.graphics.endFill();
//
//			
//
//			square.graphics.lineStyle(1, 0xffffff, 1, true);
//			square.graphics.drawRect(size/4, size/4, size/2, size/2);
//			
//			//mask.graphics.lineStyle(1, 0xffffff, 1, true);
//			mask.graphics.beginFill(0xffffff, 1);
//			mask.graphics.drawRect(0, 0, size/2, size);
//			mask.graphics.drawRect(0, size/2, size, size/2);
//			mask.graphics.endFill();
//			
//			var arrowSize:Number  = size/8;
//			
////			var h:Number = (((size/2)/0.7)/2)-arrowSize/2;
////			square2.graphics.beginFill(0xffffff, 1);
////			square2.graphics.drawRect(size/2-1, size/2-h, 2, h);
////			square2.graphics.endFill();
////			var m:Matrix = square2.transform.matrix;
////			FlexMatrixTransformer.rotateAroundInternalPoint(m, size/2, size/2, 45);
////			square2.transform.matrix = m;
//			
//			triangle.graphics.lineStyle(1, 0xffffff, 1);
//			triangle.graphics.beginFill(0xffffff, 1);
//			triangle.graphics.moveTo(size*3/4, size/4);
//			triangle.graphics.lineTo(size*3/4, size/4+arrowSize);
//			triangle.graphics.lineTo(size*3/4-arrowSize, size/4);
//			triangle.graphics.lineTo(size*3/4, size/4);
//			triangle.graphics.endFill();
//			
//			triangle.graphics.lineStyle(2, 0xffffff, 1);
//			triangle.graphics.moveTo(size/2, size/2);
//			triangle.graphics.lineTo(size*3/4-arrowSize/2, size/4+arrowSize/2);
//						
//			this.rawChildren.addChild(backround);
//			this.rawChildren.addChild(square);
//			this.rawChildren.addChild(mask);
//			//this.rawChildren.addChild(square2);
//			this.rawChildren.addChild(triangle);
//			
//			square.mask = mask;
//		}
//		
//	}
//}