# FfeD Project

## Setup Instructions

1. Clone the repository:
```bash
git clone <repository-url>
cd FfeD_project
```

2. Install dependencies:
For Linux/macOS: `./install.sh`
For Windows: `install.bat`

3. Start the services:
```bash
docker-compose up
```

## Access the services:
- CodeProject.AI Server: [http://localhost:32168](http://localhost:32168)
- MindsDB: [http://localhost:47334](http://localhost:47334)

## Development
- Create new modules in `src/modules/`
- Add Python dependencies to `requirements.txt`
- Update Docker configuration as needed
- Test modules using `explore.html`

## Testing
- Open `src/modules/NeutrosophicDataProcessing/explore.html` in a browser
- Upload an image
- Click "Remove Background"
- Check results

## Building for Production
- Update version in `modulesettings.json`
- Package the module:
```bash
./SDK/Scripts/create_packages.sh
```

## License
[Your License Here]

This setup provides:
- Complete development environment
- Docker containers for isolation
- MindsDB integration
- Testing framework
- Installation scripts
- Documentation
- Version control setup

To start development:
1. Clone the repository
2. Run installation script
3. Start Docker services
4. Begin developing in `src/modules/`

The system will automatically handle:
- Python virtual environments
- Model downloads
- Docker container creation
- Network setup
- MindsDB integration
