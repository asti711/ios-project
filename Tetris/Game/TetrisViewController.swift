import UIKit

class TetrisViewController: UIViewController {

    private var modeId: Int = 0
    @IBOutlet weak var contentView: UIView!

    var tetris:Tetris!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeGame()
    }
    
    deinit {
        self.tetris.deinitGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initializeGame() {
        // after layout pass, ensure GameView to make
        DispatchQueue.main.async {
            let gameView = GameView(self.contentView)
            gameView.setMode(mode: self.modeId)
            self.tetris = Tetris(gameView: gameView)
        }
    }

    func setMode(modeId: Int) {
        self.modeId = modeId
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first  {
            self.tetris.touch(touch)
        }
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
}
