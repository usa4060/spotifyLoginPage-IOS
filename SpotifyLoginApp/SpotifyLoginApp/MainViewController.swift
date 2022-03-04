import UIKit
import FirebaseAuth



class MainViewController : UIViewController{
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        // 로그인이 되었다면, 현재 User의 Email을 가져와야 함
        let email = Auth.auth().currentUser?.email ?? "고객"
        welcomeLabel.text = """
        환영합니다!
        \(email)님
        """
        // 아래의 경로로 따라갔을 때, ProviderID의 이름이 "password"라고 되어있으면 이메일&비밀번호로 로그인 하였다는 의미이다.
        let isEmailSignIn = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPasswordButton.isHidden = !isEmailSignIn
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        let firebaseAuth = Auth.auth()
        // logOut은 실패 시, 발생하는 error를 처리해 줘야 하므로 do ~ catch를 사용하여 처리
        do{
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }
        catch let logOutError as NSError{
            print("Error: logOut\(logOutError.description)")
        }
    }
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        // email에 저장되어 있는 메일 주소로, 비밀번호 reset메일을 보냄
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
}
