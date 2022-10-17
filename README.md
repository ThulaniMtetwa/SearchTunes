
# Search Tunes

Using the apples https://itunes.apple.com/search API. The application allows for you to 
search for music or songs, and presents to you the results of the song and the artist.

# Architecture used
- Structurally I followed the MVVM pattern

# Any design pattern used
- Singleton Pattern
- Delegate Pattern
- Facade Pattern
- Observer Pattern

# Which OOP principle applied
- Classes
- Objects
- Properties
- Methods
- Access Control
- Encapsulation
- Abstraction
- Inheritance
- Method Overriding

# Any important decision taken and its motivation
- Structurally the MVVM pattern helps allow for better test and separation of concerns
- Using delegate/interfaces to help with dependency injection and unit testing this is demonstrated on the units tests where mocking is required for my HTTPClient implementation

# Implement the bonus features according to the senior level you would like to be
considered for

- I used my knowledge of iOS native frameworks to levarage feature on them instead of relying on 3rd party frameworks. (e.g. iOS Network.framework)

# Note from me:
- More unit tests can be added to increase the current code coverage. Given more time this can be done.
- Allow for the Network layer to be generic and an not work with concrete types but rather introducing interface driven code.


![Logo](SearchTunes/Resources/App%20Screenshots/appstore.png)


## Screenshots

![App Screenshot](SearchTunes/Resources/App%20Screenshots/screenshotFour.png)
![App Screenshot](SearchTunes/Resources/App%20Screenshots/screenshotThree.png)
![App Screenshot](SearchTunes/Resources/App%20Screenshots/screenshotTwo.png)
![App Screenshot](SearchTunes/Resources/App%20Screenshots/screenshotOne.png)


## API Reference

#### Get all items

```http
  GET https://itunes.apple.com/search
```

| Parameter | Type     | Type     | Description                |
| :-------- | :------- | :------- |:------------------------- |
| `media` | `music` |     String        | **Required**. |
| `entity` | `song` |       String      |**Required**. |
| `term` | `searchTerm` |      String   | **Required**. |

Takes search term and returns the track details.


## Authors

- [@ThulaniMtetwa](https://github.com/ThulaniMtetwa)
- [Email me](mailTo:thulanimtetwa@gmail.com)
## Installation

No 3rd party frameworks are inlcuded. So just simply download or clone the project using
git.

```bash
  git clone git@github.com:ThulaniMtetwa/SearchTunes.git
```
    
## Features

- Light/dark mode toggle
- Search
- Fullscreen mode
- iPhone and iPad


## 🚀 About Me
I am a Native iOS Developer and also blog from time to time on topics around software development visit some of my posts here (https://medium.com/@thulzmtetwa)


## License

[MIT](https://choosealicense.com/licenses/mit/)

