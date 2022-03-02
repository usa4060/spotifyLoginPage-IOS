import UIKit

class LoginViewController : UIViewController{
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [emailLoginButton, googleLoginButton, appleLoginButton].forEach{
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // NavigationBar 숨기기
        navigationController?.navigationBar.isHidden = true
        
    }
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        // Google로그인 FireBase인증
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        // Apple로그인 FireBase인증
    }
}
