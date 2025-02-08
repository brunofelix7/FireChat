import Foundation
import UIKit

private let reuseIdentifier: String = "ConversationCell"

class HomeScreen : UIViewController {

    // MARK: Properties
    
    private let tableView = UITableView()
    private let profileIcon = UIImage(systemName: "person.circle.fill")
    private let addIcon = UIImage(systemName: "plus")
    private let appearance = UINavigationBarAppearance()
        
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
        
    // MARK: UI Configurations
    
    private func configureUI() {
        view.backgroundColor = .white
        configureNavBar()
        configureTableView()
    }
    
    private func configureNavBar() {
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
    
    // MARK: Selectors
    
    @objc func showProfile() {
        print("DEBUG: Show profile...")
    }
    
    @objc func addContact() {
        print("DEBUG: Add contact...")
    }
}

// MARK: Extensions

extension HomeScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = "Test cell"
        cell.textLabel?.textColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}

#Preview {
    return HomeScreen()
}
