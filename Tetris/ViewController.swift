import UIKit

// this view controller not used.
// entry view controller is TetrisViewController.
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return false
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        let tetrisViewController = TetrisViewController()
        self.present(tetrisViewController, animated: true, completion: nil)
    }
}

