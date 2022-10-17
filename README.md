
# Search Tunes

Using the apples https://itunes.apple.com/search API. The application allows for you to 
search for music or songs, and presents to you the results of the song and the artist.


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

