# 🐳 Inception - 42 School Project

**Inception** is a system administration and Docker project from **42 School** that aims to build a small, secure, and scalable web infrastructure entirely from scratch using **Docker** and **Docker Compose**.  

The project sets up a **WordPress website** running with:
- **Nginx (SSL/TLS)** — acting as the web server  
- **MariaDB** — as the database  
- **PHP-FPM** — to handle dynamic PHP content  

Each service runs in its **own container**, connected through a **custom Docker network** with **persistent volumes** for data storage.

---

## 🚀 Bonus Part

The **bonus** part enhances the infrastructure with additional services:
- 🧠 **Redis** — caching system to improve performance  
- 📂 **FTP Server** — for file transfer and management  
- 🧩 **Adminer** — a lightweight web interface for database administration
+ for the 5 container i did have to choose anyone i want and i choose potainer because i have a lot of container and it make it easy to manage them and check there lifetime the hall time.
- 📊 **Portainer** — to manage and monitor Docker containers visually  

---

## 📁 Project Structure

inception/


├── Makefile


├── srcs/


│ ├── docker-compose.yml


│ ├── requirements/


│ │ ├── mariadb/


│ │ │ ├── Dockerfile


│ │ │ └── tools/


│ │ │ └── script.sh


│ │ ├── nginx/


│ │ │ ├── Dockerfile


│ │ │ └── conf/


│ │ │ └── nginx.conf


│ │ ├── wordpress/


│ │ │ ├── Dockerfile


| | | ├── tools/


| | | | ├── wordpress.sh


│ │ ├── bonus/


│ │ │ ├── redis/


│ │ │ │ └── Dockerfile


│ │ │ ├── ftp/


│ │ │ │ └── Dockerfile


│ │ │ ├── adminer/


│ │ │ │ └── Dockerfile


│ │ │ └── portainer/


│ │ │ └── Dockerfile


│ └── .env


└── data/


├── mariadb/


└── wordpress/


this is a diagrame of what is the hall thing that inception is want at the end :

         ┌────────────────────────┐
         │        Client          │
         │ (Browser - HTTPS 443)  │
         └────────────┬───────────┘
                      │
                ▼▼▼   ▼▼▼
         ┌────────────────────────┐
         │        NGINX           │
         │   Reverse Proxy + SSL  │
         └────────────┬───────────┘
                      │
                ▼▼▼   ▼▼▼
         ┌────────────────────────┐
         │       WordPress        │
         │     (PHP-FPM App)      │
         └────────────┬───────────┘
                      │
         ┌────────────────────────┐
         │        MariaDB         │
         │     (Database Layer)   │
         └────────────────────────┘
                      │
         ┌────────────────────────┐
         │         Redis          │
         │   (Bonus - Cache)      │
         └────────────────────────┘


## ⚙️ Usage

### Build and Start the Project
```bash
make up (start the containers)
make down (stop container)
make fclean (stop and delete all the coantainer and volumes)
make re (make fclean && make up)
