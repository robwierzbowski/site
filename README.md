# Site

A no transpile, no build microsite. Happily trading dependencies and
pipelines for some extra typing. Modern browsers make it _fun_ to write code
like it's 200X.

## Local development

```shell
# Install a tiny tool for HTML partials
npm install

npm run dev
```

### Optimize and subset fonts

We need to subset fonts for best performance, especially since I'm preloading fonts for a more refined experience. To do this we use [Zach Leatherman's](https://twitter.com/zachleat) project [glyphhanger](https://github.com/zachleat/glyphhanger) and the [pyftsubset library](https://fonttools.readthedocs.io/en/latest/subset/index.html), with some help from [Sara Soueidan's](https://twitter.com/SaraSoueidan) [glyphhanger tutorial](https://www.sarasoueidan.com/blog/glyphhanger) and [Markos Kon's](https://twitter.com/markos_kon) [post on optimizing fonts with pyftsubset](https://markoskon.com/creating-font-subsets/). [Fontdrop](https://fontdrop.info/) is a helpful tool to check the feature and character set of an optimized font.

Install dependencies:

```shell
brew install python3
python3 -m ensurepip
pip3 install fonttools brotli zopfli
```

Generate optimized fonts:

```shell
generate_webfonts.sh
```

## Testing in production

Load [https://robwierzbowski.com](https://robwierzbowski.com).
