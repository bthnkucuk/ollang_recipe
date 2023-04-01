import UIKit
import Lottie

public class MyOppenViewController: UIViewController {
    
    private var animationView: LottieAnimationView?
    
    public override func viewDidAppear(_ animated: Bool) {
        animationView = .init(name: "open_animation_recipe")
       // animationView!.frame = view.frame
       // animationView!.contentMode = .scaleAspectFit
       // animationView!.sizeThatFits(CGSize(width: 100, height: 50))
        
        animationView!.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        animationView!.center = self.view.center
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1.00
        view.addSubview(animationView!)
        animationView!.play{ (finished) in
            
          
        }
        self.startFlutterApp()
    }
    
    func startFlutterApp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let flutterEngine = appDelegate.flutterEngine
        let flutterViewController =
            FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        flutterViewController.modalPresentationStyle = .custom
        flutterViewController.modalTransitionStyle = .crossDissolve
        
        present(flutterViewController, animated: true, completion: nil)
        
    }
}
