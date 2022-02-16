
import UIKit

class ViewController: UIViewController {
    let size = CGSize(width: 400, height: 400)
    let safeArea:CGFloat = 50
    var spaceBars:CGFloat = 50+20
    
    let listNumbers:[CGFloat] = [3,7,4,1,8]

    public override func viewDidLoad() -> Void {
        super.viewDidLoad()

        for x in self.listNumbers {
            self.drawBars(h: x)
        }
        self.drawLine()
    }
    
    private func drawLine() -> Void {
        let graph  = CAShapeLayer()
        graph.strokeColor = UIColor.yellow.cgColor
        graph.fillColor = UIColor.yellow.cgColor
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: self.safeArea, y: self.safeArea*2))
        path.addLine(to: CGPoint(x: self.safeArea, y: self.size.height))
        
        path.move(to: CGPoint(x: 0, y: self.size.height-50))
        path.addLine(to: CGPoint(x: self.size.width, y: self.size.height-50))
        
        graph.path = path

        self.view.layer.addSublayer(graph)
    }
    
    
    private func drawBars(h:CGFloat) -> Void {
        let shape  = CAShapeLayer()
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.blue.cgColor
        
        let path = CGMutablePath()
        path.addRect(CGRect(x: self.spaceBars-2, y: self.size.height-50, width: 30, height: -h*20))
    
        shape.path = path
        
        self.view.layer.addSublayer(shape)
        self.spaceBars +=  50
    }

}

