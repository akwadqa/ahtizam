<div style="display: flex; justify-content: start; align-items: center; margin-bottom: 15px">
  <span style="color: #00AACC; font-size: 3em; font-weight: bold;">AKWAD TEAM</span>
  <img src="https://i.ibb.co/f2Wym86/608114aa24859d84c2343a1fe2e4d49c.gif" alt="Description of the GIF" width="75" height="75">
</div>

# Ahtezam 🚗🔧

[![Flutter](https://img.shields.io/badge/Flutter-2.10.0-blue)](https://flutter.dev) [![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)

Welcome to **Ahtezam** – your reliable solution for moving your broken-down car quickly and smoothly. This Flutter project simplifies the process of towing your vehicle, offering an intuitive and seamless experience powered by Flutter.

---

## Features ✨

- **Effortless Car Relocation:** Move your inoperable car with ease.
- **Smooth Operation:** Enjoy a seamless and user-friendly interface.
- **GitLab Integration:** Seamlessly manage your project with GitLab for version control and continuous integration.

---


<div style="display: flex; justify-content: start; align-items: center;">
  <span style="color: #AA55EE; font-size: 2em;">Getting Started</span>
  <img src="https://i.ibb.co/JBzZx0S/output-onlinegiftools.gif" alt="Description of the GIF" width="100" height="75">
</div>

Steps you need to do for setup your project




### Installation

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
2.** Install Dependencies:**


  ```flutter pub get

3. 
### <span style="color: #AA99EE;">**Generating code:**</span>

There is local storage based on `hive` package for storing user settings in the app,also, for
locliziation we need to generate this file

- ### <span style="color: #99B8EE;">**``Hive``:**</span>

```CSS
dart run build_runner build --delete-conflicting-outputs
```


- <span style="color: #FF8800;">**Assets**</span>

Create folder in the root path named it `assets`, inside this folder create four folders

- `images` : For images
- `icons` : For custom icons
- `fonts` : For custom fonts
- `translations` : For localization
    - Based on the locales on your projecy make `json` file for each locale with the name of the
      locale, there is already two general locales (En , Ar) as follow:

  ar.json:
  ```json
  {
    "some_word":"ar_translate"
  }
  ```
  en.json:
  ```json
  {
    "some_word":"en_translate"
  }
  ```



   <div style="display: flex; justify-content: start; align-items: center;"> <span style="color: #FF1313; font-size: 2em;"><b>IMPORTANT NOTE❕</b></span> <img src="https://i.ibb.co/020y8yP/e06514213da08cbfc3b307aba3d37fce.gif" alt="important note gif" width="120" height="120"> </div>
Make sure to use the correct versions for each package. You can add dependencies using your IDE (for example, in VS Code, press Ctrl + P, then type Dart: Add Dependency).

<div style="display: flex; justify-content: start; align-items: center;"> <span style="color: #AA55EE; font-size: 2em;"><b>You reached here, champ!</b></span> <img src="https://i.ibb.co/6grBgfb/output-onlinegiftools-1.gif" alt="celebration gif" width="100" height="75"> </div>
Made with ❤️ by the Akwad Team
