//
//  GraphView.swift
//  PhysioGuide_7
//
//  Created by Rohm on 12/6/15.
//  Copyright © 2015 Team STAR. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GraphView: UIView {

    // have to get the data from calories into here
    var graphPoints:[Int] = []
    
    @IBInspectable var startColor : UIColor = UIColor.blueColor()
    @IBInspectable var endColor : UIColor = UIColor.greenColor()
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.

    
        
    
    override func drawRect(rect: CGRect) {
        
        let numsInStr : [String] = [CalSave.sharedCalSave.cal1!, CalSave.sharedCalSave.cal2!, CalSave.sharedCalSave.cal3!, CalSave.sharedCalSave.cal4!, CalSave.sharedCalSave.cal5!]
        var index = 0;
        
        while (index < 5)
        {
            if(numsInStr[index] != "")
            {
                
                let calVal : Int? = Int(numsInStr[index])
                graphPoints.append(calVal!)
                
            }
            index++
        }
        
        let width = rect.width
        let height = rect.height
        
        // set up clipping area
        var path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 8.0, height: 8.0))
        path.addClip()
        
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor, endColor.CGColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocations)
        
        // Calc x points
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x:0, y:self.bounds.height)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue:0))
        
        let margin:CGFloat = 20.0
        var columnXPoint = { (column:Int)  -> CGFloat in
            //Calc the gap between points
            let spacer = (width - margin*2 - 4) /
                CGFloat((self.graphPoints.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
        // Calc y points
        let topBorder:CGFloat = 60
        let bottomBorder:CGFloat = 50
        let graphHeight = height - topBorder - bottomBorder
        let maxValue = graphPoints.maxElement()
        var columnYPoint = { (graphPoint:Int) -> CGFloat in
            var y:CGFloat = CGFloat(graphPoint) /
                CGFloat(maxValue!) * graphHeight
            y = graphHeight + topBorder - y
            return y
            
        }
        
        // draw the line of the graph
        
        UIColor.whiteColor().setFill()
        UIColor.whiteColor().setStroke()
        
        // set up the points line
        var graphPath = UIBezierPath()
        // Line start
        graphPath.moveToPoint(CGPoint(x:columnXPoint(0), y:columnYPoint(graphPoints[0])))
        
        // add points for each item in the graphPoints array
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            graphPath.addLineToPoint(nextPoint)
            
        }
        CGContextSaveGState(context)
        
        var clippingPath = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLineToPoint(CGPoint(
            x:columnXPoint(graphPoints.count - 1),
            y:height))
        clippingPath.addLineToPoint(CGPoint(
            x:columnXPoint(0),
            y:height))
        clippingPath.closePath()
        
        clippingPath.addClip()
        
        let highestYPoint = columnYPoint(maxValue!)
        startPoint = CGPoint(x:margin, y:highestYPoint)
        endPoint = CGPoint(x:margin, y:self.bounds.height)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
        CGContextRestoreGState(context)
        
        /*let rectPath = UIBezierPath(rect: self.bounds)
        rectPath.fill()*/
        
        graphPath.lineWidth = 2.0
        graphPath.stroke()
        
        for i in 0..<graphPoints.count {
            var point = CGPoint(x:columnXPoint(i), y:columnYPoint(graphPoints[i]))
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            let circle = UIBezierPath(ovalInRect:
                CGRect(origin: point,
                    size: CGSize(width: 5.0, height: 5.0)))
            
            circle.fill()
        }
        
        //horizontal lines
        var linePath = UIBezierPath()
        
        //top
        linePath.moveToPoint(CGPoint(x:margin, y:topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:topBorder))
        
        //mid
        linePath.moveToPoint(CGPoint(x:margin, y:graphHeight/2 + topBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:graphHeight/2 + topBorder))
        
        //bot
        linePath.moveToPoint(CGPoint(x:margin, y:height - bottomBorder))
        linePath.addLineToPoint(CGPoint(x:width - margin, y:height - bottomBorder))
        
        let color = UIColor(white: 1.0, alpha: 0.3)
        color.setStroke()
        
        linePath.lineWidth = 1.0
        linePath.stroke()
        
        
        
    }
    
    

}
