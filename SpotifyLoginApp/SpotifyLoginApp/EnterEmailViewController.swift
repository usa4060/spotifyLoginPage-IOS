import UIKit
import Firebase


class EnterEmailViewController : UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextField: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 30
        nextButton.isEnabled = false
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // view가 생성 되었을 때, 커서가 emailTextField에 바로 위치할 수 있게 해줌
        emailTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // NavigagionBar 보이기
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // FireBase에 이메일 및 비밀번호 값 입력하기
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // 신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) {
            [weak self]  authResult, error in
            guard let self = self else {return}
            
            // 이메일 회원가입 시 에러처리 구문
            if let error = error {
                
                let code = (error as NSError).code
                switch code {
                case 17007: // 이미 가입 한 계정일 때 (17007 error가 이미 있는 계정일 때 나오는 에러)
                    // 로그인하기
                    self.loginUser(withEmail: email, password: password)
                default:
                    // 기본 error 발생 안내 구문
                    self.errorTextField.text = error.localizedDescription
                }
            }
            else{
                self.showMainViewController()
            }
            
        }
    }
    
    private func showMainViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController" )
        mainViewController.modalPresentationStyle = .fullScreen
        navigationController?.show(mainViewController, sender: nil)
    }
    
    private func loginUser(withEmail email : String, password : String){
        Auth.auth().signIn(withEmail: email, password: password){[weak self] _, error in
            guard let self = self else {return}
            
            if let error = error {
                self.errorTextField.text = error.localizedDescription
            }
            else {
                self.showMainViewController()
            }
            
        }
    }
}

extension EnterEmailViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEnailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        nextButton.isEnabled = !isEnailEmpty && !isPasswordEmpty
    }
}
