<br>

<p align="center">
  <a href="https://sitesurface.com">
    <img src="https://res.cloudinary.com/sitesurface/image/upload/v1671124336/purple_black-01_n3em4w.png" width="288px" alt="Sitesurface Logo" />
  </a>
</p>

<h1 align="center">Sitesurface Flutter Deploy</h1>

<p align="center">
  <strong>Deploy Your App To Gihub Pages</strong><br>
Deploy your website to github pages hassle free with one command.
</p>

<br>

<p align="center">
  If you find this package useful like 👍 the package and share with other developers.
</p>

<br>

<p align="center">
  <a href="https://pub.dartlang.org/packages/sitesurface_flutter_deploy">
    <img alt="Pub" src="https://img.shields.io/pub/v/sitesurface_flutter_deploy" />
  </a>
</p>

<br>

<p align="center">
  <a href="https://sitesurface.com">
    <img alt="Chat Image" src="https://res.cloudinary.com/sitesurface/image/upload/v1685796258/Sitesurface/Packages/sitesurface_flutter_deploy/banner_pljllb.jpg" />
  </a>
</p>

<br>

### Requirements

`Dart >=3.0.2` and `Flutter >=1.17.0`

## Getting Started

A command-line tool which simplifies the task of uploading your flutter app to gihub pages. It also fixes some of the common issues faced by developers while deploying to github pages.

## :book: Guide

### 1. Setup the config file

Add your Sitesurface Flutter Deploy configuration to your `pubspec.yaml`. An example is shown below. More complex examples [can be found in the example projects](https://github.com/Sitesurface/sitesurface_flutter_deploy/tree/master/example).

```yaml
dev_dependencies:
  sitesurface_flutter_deploy: "^0.0.2"

sitesurface_flutter_deploy:
  repository: "<url of repository where you want to deploy>"
```

### 2. Run the package

After setting up the configuration, all that is left to do is run the package.

```shell
flutter pub get
dart run sitesurface_flutter_deploy
```

If you name your configuration file something other than `sitesurface_flutter_deploy.yaml` or `pubspec.yaml` you will need to specify
the name of the file when running the package.

```shell
flutter pub get
flutter pub run sitesurface_flutter_deploy --path=path/to/my/file.yaml
```

Note: If you are not using the existing `pubspec.yaml` ensure that your config file is located in the same directory as it.

## :mag: Attributes

Shown below is the full list of attributes which you can specify within your Sitesurface Flutter Deploy configuration.

- `repository`: The url of Github Repository where you want to deploy your site.
- `build`: If you want to override the commands used by package to build the web project then you can pass your commands here

## Issues and feedback

Please file Sitesurface Flutter Deploy specific issues, bugs, or feature requests in our [issue tracker](https://github.com/Sitesurface/sitesurface_flutter_deploy/issues/new).

Plugin issues that are not specific to Sitesurface Flutter Chat can be filed in the [Flutter issue tracker](https://github.com/flutter/flutter/issues/new).

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/Sitesurface/sitesurface_flutter_deploy/issues/new).
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/Sitesurface/sitesurface_flutter_deploy/pulls).
