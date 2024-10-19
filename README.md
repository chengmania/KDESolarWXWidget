# **HF Prop Data KDE Plasma Widget**

 ![image](https://github.com/user-attachments/assets/48cd1175-7b6a-469c-bdd5-0bd5d4f034e7)

Displays solar weather data from HamQSL, including Solar Flux, Sunspots, A-Index, K-Index, Geomagnetic Field, and Signal Noise.
## **Table of Contents**
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Packaging the Widget](#packaging-the-widget)
  - [Installing the Widget](#installing-the-widget)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## **Features**
- Displays up-to-date solar weather data.
- Color-coded A-Index and K-Index values for quick assessment.
- Automatic data refresh every hour.
- Customizable and themable to match your desktop.
- Acknowledgments to HamQSL.com and Paul N0NBH.
## **Prerequisites**
- **KDE Plasma 5.0 or later**
- **Qt 5.15 or later**
- **Plasma SDK** (for testing and packaging)
- **Internet Connection** (to fetch data from HamQSL)
## **Installation**
### **Packaging the Widget**
First, you'll need to package the widget into a .plasmoid file, which is essentially a ZIP archive with a specific structure.

1. **Clone or Download the Repository**

```bash
git clone https://github.com/chengmania/KDESolarWXWidget.git
cd KDESolarWXWidget
```
1. **Verify the Directory Structure**

Ensure the widget files are organized as follows:
```
KDESolarWXWidget/

├── contents/
│   ├── ui/
│       └── main.qml
└── metadata.desktop
```
1. **Create the** .plasmoid **Package**

Use the zip command to package the widget:
```
zip -r hf_prop_data.plasmoid ./ *
```

This command creates a hf\_prop\_data.plasmoid file containing all the necessary files.
### **Installing the Widget**
Once you have the .plasmoid file, you can install it into your KDE Plasma environment.

1. **Install Using** plasmapkg2

```
plasmapkg2 --install hf_prop_data.plasmoid
```
If you're updating an existing installation, use:

```
plasmapkg2 --upgrade hf_prop_data.plasmoid
```

1. **Verify Installation**

You should see a message indicating that the widget was successfully installed.
## **Usage**
1. **Add the Widget to Your Desktop**
   1. **Right-click** on your desktop and select **"Add Widgets..."**.
   1. Search for **"HF Prop Data"** in the Widgets list.
   1. **Drag and drop** the widget onto your desktop.
1. **Add the Widget to a Panel**
   1. **Right-click** on your panel and select **"Add Widgets..."**.
   1. Search for **"HF Prop Data"** and add it to your panel.
1. **Interacting with the Widget**
   1. The widget will automatically fetch and display the latest solar weather data.
   1. Data refreshes every hour.
   1. A-Index and K-Index values are color-coded:
      1. **Green (1-5)**
      1. **Yellow (6-9)**
      1. **Red (10 and above)**
## **Configuration**
Currently, the widget does not have configurable settings. Future updates may include customization options for refresh intervals, data fields, and theming.
## **Contributing**
Contributions are welcome! If you'd like to contribute:

1. **Fork** the repository.
1. **Create** your feature branch: git checkout -b feature/YourFeature
1. **Commit** your changes: git commit -am 'Add some feature'
1. **Push** to the branch: git push origin feature/YourFeature
1. **Submit** a pull request.

Please ensure your code adheres to the project's coding standards and includes appropriate documentation.
## **License**
This project is licensed under the **GPL-3.0 License**. See the [LICENSE](http://LICENSE/) file for details.
## **Acknowledgments**
- **HamQSL.com** and **Paul N0NBH** for providing the solar weather data.
- **Chengmania** for creating this widget for the KDE community.
- The **KDE Community** for their support and the Plasma framework.
