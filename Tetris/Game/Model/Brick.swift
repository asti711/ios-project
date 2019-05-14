import UIKit

enum BrickType {
    case i(UIColor)
    case j(UIColor)
    case l(UIColor)
    case t(UIColor)
    case z(UIColor)
    case s(UIColor)
    case o(UIColor)
    case p(UIColor)
    case r(UIColor)
    case k(UIColor)
    case q(UIColor)
    case w(UIColor)
    case e(UIColor)
    case f(UIColor)
    case d(UIColor)
    case a(UIColor)
    case b(UIColor)
    case c(UIColor)
    case g(UIColor)
    case h(UIColor)
    case m(UIColor)
    case n(UIColor)
    case v(UIColor)
    case u(UIColor)
    case x(UIColor)
    case y(UIColor)
}

class Brick: NSObject {
    
    var points = [CGPoint]()
    var tx:Int = 5
    var ty:Int = 0
    var color = UIColor.clear
    var brickType = Brick.bricks[0]
    
    static var nextBricks = [Brick]()
    static var nextBrickCount = 3
    
    static var bricks = [
        BrickType.i(UIColor(red:0.40, green:0.64, blue:0.93, alpha:1.0)),
        BrickType.j(UIColor(red:0.31, green:0.42, blue:0.80, alpha:1.0)),
        BrickType.l(UIColor(red:0.81, green:0.47, blue:0.19, alpha:1.0)),
        BrickType.t(UIColor(red:0.67, green:0.45, blue:0.78, alpha:1.0)),
        BrickType.z(UIColor(red:0.80, green:0.31, blue:0.38, alpha:1.0)),
        BrickType.s(UIColor(red:0.61, green:0.75, blue:0.31, alpha:1.0)),
        BrickType.o(UIColor(red:0.88, green:0.69, blue:0.25, alpha:1.0))
    ]
    
    static var simplifiedBricks = [
        BrickType.f(UIColor(red:0.40, green:0.64, blue:0.93, alpha:1.0)),
        BrickType.d(UIColor(red:0.31, green:0.42, blue:0.80, alpha:1.0)),
        BrickType.k(UIColor(red:0.81, green:0.47, blue:0.19, alpha:1.0)),
        BrickType.q(UIColor(red:0.67, green:0.45, blue:0.78, alpha:1.0)),
        BrickType.w(UIColor(red:0.80, green:0.31, blue:0.38, alpha:1.0)),
        BrickType.o(UIColor(red:0.61, green:0.75, blue:0.31, alpha:1.0))
    ]
    
    static var extendedBricks = [
        BrickType.p(UIColor(red:0.40, green:0.64, blue:0.93, alpha:1.0)),
        BrickType.r(UIColor(red:0.31, green:0.42, blue:0.80, alpha:1.0)),
        BrickType.e(UIColor(red:0.81, green:0.47, blue:0.19, alpha:1.0)),
        BrickType.a(UIColor(red:0.67, green:0.45, blue:0.78, alpha:1.0)),
        BrickType.b(UIColor(red:0.80, green:0.31, blue:0.38, alpha:1.0)),
        BrickType.c(UIColor(red:0.61, green:0.75, blue:0.31, alpha:1.0)),
        BrickType.g(UIColor(red:0.88, green:0.69, blue:0.25, alpha:1.0)),
        BrickType.h(UIColor(red:0.30, green:0.90, blue:0.30, alpha:1.0)),
        BrickType.m(UIColor(red:0.40, green:0.80, blue:0.40, alpha:1.0)),
        BrickType.n(UIColor(red:0.50, green:0.70, blue:0.50, alpha:1.0)),
        BrickType.v(UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)),
        BrickType.u(UIColor(red:0.70, green:0.50, blue:0.70, alpha:1.0)),
        BrickType.x(UIColor(red:0.80, green:0.40, blue:0.80, alpha:1.0)),
        BrickType.y(UIColor(red:0.90, green:0.30, blue:0.90, alpha:1.0))
    ]

    static func newBrick(mode: Int) -> Brick {
        var brickType = bricks[0]
        if mode == 0 {
            let index = Int(arc4random_uniform(UInt32(self.bricks.count)))
            brickType = bricks[index]
        } else if mode == 2 {
            let index = Int(arc4random_uniform(UInt32(self.extendedBricks.count)))
            brickType = extendedBricks[index]
        } else if mode == 1 {
            let index = Int(arc4random_uniform(UInt32(self.simplifiedBricks.count)))
            brickType = simplifiedBricks[index]
        }
        
        let brick = Brick(brickType)
        brick.ty = -brick.vertical()
        return brick
    }
    
    static func generate(mode: Int) -> Brick {
        //print("In generate mode: \(mode)")
        while self.nextBricks.count < self.nextBrickCount {
            self.nextBricks.append(self.newBrick(mode: mode))
        }
        let brick = self.nextBricks.remove(at: 0)
        self.nextBricks.append(self.newBrick(mode: mode))
        return brick
    }
    
    init(_ brickType:BrickType) {
        self.brickType = brickType
        switch brickType {
        case BrickType.i(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 0, y: 3))
        case BrickType.j(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
            self.points.append(CGPoint(x: 0, y: 2))
        case BrickType.l(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 1, y: 2))
        case BrickType.t(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
        case BrickType.z(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
        case BrickType.s(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
        case BrickType.o(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
        case BrickType.f(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
        case BrickType.d(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
        case BrickType.k(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
        case BrickType.q(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
        case BrickType.w(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 0, y: 1))
        case BrickType.p(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 3, y: 1))
        case BrickType.r(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 3, y: 1))
        case BrickType.e(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
            self.points.append(CGPoint(x: 2, y: 2))
        case BrickType.a(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 2, y: 0))
        case BrickType.b(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 3, y: 0))
            self.points.append(CGPoint(x: 4, y: 0))
        case BrickType.c(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
        case BrickType.g(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
            self.points.append(CGPoint(x: 2, y: 0))
        case BrickType.h(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 2, y: 2))
        case BrickType.m(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 3, y: 1))
            self.points.append(CGPoint(x: 3, y: 0))
        case BrickType.n(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 0))
        case BrickType.v(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 3, y: 0))
        case BrickType.u(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 3, y: 1))
        case BrickType.x(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
        case BrickType.y(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 2, y: 1))
            self.points.append(CGPoint(x: 3, y: 1))
//        default:
//            return
        }
    }
    
    func moveDown() {
        ty += 1
    }
    func moveLeft() {
        tx -= 1
    }
    func moveRight() {
        tx += 1
    }
    
    func rotatedPoints() -> [CGPoint] {

        switch self.brickType {
        case BrickType.o:
            return self.points
        default:
            // 1. 회전의 중점 구하기
            var mx = self.points.reduce(CGFloat(0), { (initValue:CGFloat, p:CGPoint) -> CGFloat in
                return initValue + p.x
            })
            var my = self.points.reduce(CGFloat(0), { (initValue:CGFloat, p:CGPoint) -> CGFloat in
                return initValue + p.y
            })
            mx = CGFloat(Int(mx)/self.points.count)
            my = CGFloat(Int(my)/self.points.count)
            
            let sinX:CGFloat = 1
            let cosX:CGFloat = 0
            
            var rotatedBrick = [CGPoint]()
            
            for p in self.points {
                let r = p.y
                let c = p.x
                let x = (c-mx) * cosX - (r-my)*sinX
                let y = (c-mx) * sinX + (r-my)*cosX
                rotatedBrick.append(CGPoint(x: x, y: y))
            }
            return rotatedBrick
        }
    }
    
    
    
    func left() -> CGPoint {
        var left = self.points[0]
        for p in self.points {
            if left.x > p.x {
                left = p
            }
        }
        return left
    }
    func right() -> CGPoint {
        var right = self.points[0]
        for p in self.points {
            if right.x < p.x {
                right = p
            }
        }
        return right
    }
    func bottom() -> CGPoint {
        var bottom = self.points[0]
        for p in self.points {
            if bottom.y < p.y {
                bottom = p
            }
        }
        return bottom
    }
    func top() -> CGPoint {
        var top = self.points[0]
        for p in self.points {
            if top.y > p.y {
                top = p
            }
        }
        return top
    }
    
    // vertical length
    func vertical() -> Int {
        return Int(self.bottom().y) + 1
    }

}
