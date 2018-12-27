import UIKit

class ViewController: UIViewController {
    
    var results = ["1", "2", "3", "4", "5", "6", "大トリ"]
    var list = [String]()
    var label = UILabel()
    var textfield = UITextField()
    var personLabel = UILabel()
    var textFieldString = [String]()
    
    func checkLength(_ random:Int,_ results:inout [String],_ list:inout [String]) {
        list.append(results[Int(random)])
        self.label.text = list.isEmpty ? "" : list.joined(separator: " , ")
        results.remove(at: Int(random))
        textFieldString += [textfield.text!]
        self.textLabel.text = textFieldString.joined(separator: " , ")
        textfield.text = ""
        
        //値をリセット
        if results.count == 0{
            results = ["1", "2", "3", "4", "5", "6", "大トリ"]
            list = [String]()
            textFieldString = [String]()
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func getOmikuji(_ sender: Any) {
        let random = arc4random_uniform(UInt32(results.count))
        self.myLabel.text = results[Int(random)]
        checkLength(Int(random), &results, &list)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.frame = CGRect(x:70, y:150, width:350, height:30)
        label.text = list.isEmpty ? "" : list.joined(separator: ", ")
        label.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(label)
        
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = myLabel.bounds.width / 2
        
        textfield = UITextField()
        textfield.frame = CGRect(x: self.view.frame.width / 2 - 100, y: self.view.frame.height - 150 , width: 200, height: 30)
        textfield.delegate = self as? UITextFieldDelegate
        textfield.borderStyle = .roundedRect
        textfield.clearButtonMode = .whileEditing
        textfield.returnKeyType = .done
        textfield.placeholder = "入力してください"
        self.view.addSubview(textfield)
    }
    
    //完了を押すとkeyboardを閉じる処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.textfield.isFirstResponder) {
            self.textfield.resignFirstResponder()
        }
    }
    
    
}

