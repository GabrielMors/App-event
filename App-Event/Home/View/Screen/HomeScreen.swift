
import UIKit

enum textLabel: String {
    case name = "List Of Event"
}

class HomeScreen: UIView {
    
// MARK: - Elementos de visuais
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = textLabel.name.rawValue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .lightGray
        label.backgroundColor = .darkGray
        label.clipsToBounds = true
        label.layer.cornerRadius = 7.5
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configContraints()
    }
    
    private func addSubViews() {
        self.addSubview(self.tableView)
        self.addSubview(self.titleLabel)
    }
    
    public func configProtocolTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configContraints() {
        tableView.pin(to: self)
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        
        ])
    }
}


