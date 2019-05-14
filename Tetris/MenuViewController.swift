import UIKit

class MenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var modePickerView: UIPickerView!
    
    let modes = ["Classic","Simplified","Extended"]
    private var modeId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modePickerView.delegate = self
        modePickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TetrisViewController") as! TetrisViewController
        vc.setMode(modeId: modeId)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.modeId = row
        return modes[row]
    }

}
