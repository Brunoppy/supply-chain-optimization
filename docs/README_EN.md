# Supply Chain Optimization

## 📌 Description
This project is designed to optimize the supply chain by tracking shipments, managing warehouses, and ensuring an efficient inventory control system.

## 📂 Database Structure
| Table Name  | Description |
|-------------|------------|
| `suppliers`  | Stores information about suppliers, including reliability scores. |
| `warehouses` | Lists storage locations with their capacity. |
| `shipments`  | Tracks shipments from suppliers to warehouses. |
| `inventory`  | Manages stock levels at each warehouse. |

## 🔍 Key SQL Queries
| Query Purpose        | SQL Command |
|----------------------|------------|
| Check pending shipments | `SELECT * FROM shipments WHERE status = 'Pending';` |
| Monitor inventory stock levels | `SELECT warehouse_name, product_name, stock_level FROM inventory JOIN warehouses ON inventory.warehouse_id = warehouses.warehouse_id;` |

## 🚀 How to Use
1. Run the SQL script to create the database and tables.
2. Insert sample data for suppliers, warehouses, and shipments.
3. Use the provided queries to analyze shipment status and stock levels.

## 📤 How to Upload to GitHub
```bash
cd path/to/project  # Navigate to the project folder
git init  # Initialize the repository (if not already initialized)
git add .  # Add all files
git commit -m "Added Supply Chain Optimization Project"
git remote add origin https://github.com/YourUsername/YourRepository.git  # Add GitHub repository
git push -u origin main  # Upload files to GitHub
