import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "First"
        
        // Create a toolbar
        let toolbar = UIToolbar()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolbar)
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Add a toolbar item
        let toolbarButton = UIBarButtonItem(
            title: "Go To Second",
            style: .plain,
            target: self,
            action: #selector(toolbarButtonTapped(_:))
        )
        toolbar.setItems([toolbarButton], animated: false)
        
        // This has no effect whether it's true of false
        extendedLayoutIncludesOpaqueBars = true
        
        // Setting isTranslucent to false fixes the issue,
        // but I want a translucent toolbar
        toolbar.isTranslucent = true
    }
    
    @objc private func toolbarButtonTapped(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.show(secondVC, sender: nil)
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Second"
    }
}
