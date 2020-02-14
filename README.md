# AlertableProtocol
Alertable - protocol extension for UIAlertController

- Download and add in your project AlertableProtocol.swift file.
- Do Inheritance your controller from Alertable protocol.
- Create enum with action cases, add "title" and alert action "style"
- Action buttons will be created automatically
- Call method self.showAlert(...

Also you can use SPM to install (https://github.com/SergeyPetrovi4/Alertable/blob/master/README.md)

Usage: 

```
class ViewController: UIViewController, Alertable {
    
    enum Operations: ActionRepresentable {
        
        case AddNew
        case DeleteAll
        
        var rawValue: (title: String, style: UIAlertAction.Style) {
            get {
                switch self {
                case .AddNew:
                    return ("AddNew", .default)
                case .DeleteAll:
                    return ("DeleteAll", .destructive)
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showAlert(title: "Title", message: "Message", style: .alert, actions: Operations.self) { (action) in
            
            switch action {
            case .AddNew:
                print("Pressed .AddNew")
            case .DeleteAll:
                print("Pressed .DeleteAll")
            }
        }
    }
}

```
