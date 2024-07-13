import Foundation
import UIKit

private let reuseIdentifier: String = "ConversationCell"

class HomeViewController : UIViewController {

    private let tableView = UITableView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
        
    private func configureUI() {
        view.backgroundColor = .white
        configureNavBar()
        configureTableView()
    }
    
    private func configureNavBar() {
        let profileIcon = UIImage(systemName: "person.circle.fill")
        let addIcon = UIImage(systemName: "plus")
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .purple
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.title = "Messages"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: profileIcon,
            style: .plain,
            target: self,
            action: #selector(showProfile))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: addIcon,
            style: .plain,
            target: self,
            action: #selector(addContact))
    }
    
    private func configureTableView() {
        tableView.backgroundColor = .white
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }
    
    @objc func showProfile() {
        print("show profile action")
    }
    
    @objc func addContact() {
        print("Add contact action")
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = "Test cell"
        cell.textLabel?.textColor = .black
        return cell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}
