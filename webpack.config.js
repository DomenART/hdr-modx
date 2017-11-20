const webpack = require('webpack');
const path = require('path');
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const version = require('./package.json').version;
const env = process.env.WEBPACK_ENV;

const PATHS = {
	source: path.join(__dirname, 'src/'),
	build: path.join(__dirname, 'public/assets/template/')
}

// Main Settings config
module.exports = {
	entry: {
		main: PATHS.source + 'js/main.js',
		ajaxform: PATHS.source + 'js/ajaxform.js',
		tickets: PATHS.source + 'js/tickets.js'
	},
	output: {
		path: PATHS.build,
		filename: '[name].js'
	},
	module: {
		rules: [{
			test: /\.js$/,
			exclude: /(node_modules|bower_components)/,
			loader: 'babel-loader'
		}, {
			test: /\.vue$/,
			loader: 'vue-loader',
			options: {
				extractCSS: true,
				loaders: {
					js: {
						loader: 'babel-loader',
						options: {
							presets: ['es2015']
						}
					}
				}
			}
		}, {
			test: /\.less$/,
			use: ExtractTextPlugin.extract({
				fallback: "style-loader",
				use: [{
					loader: "css-loader",
					options: {
						minimize: env === 'production' ? true : false
					}
				}, {
					loader: "less-loader"
				}]
			})
		}, {
			test: /\.s[a|c]ss$/,
			use: ExtractTextPlugin.extract({
				fallback: "style-loader",
				use: [{
					loader: "css-loader",
					options: {
						minimize: env === 'production' ? true : false
					}
				}, {
					loader: "sass-loader"
				}]
			})
		}, {
			test: /\.(png|jpg|gif|svg)$/,
			use: [{
				loader: 'file-loader',
				options: {
					name: '[name].[ext]?[hash]',
					outputPath: 'img/'
				}
			}]
		}, {
			test: /\.(eot|woff|ttf|otf)$/,
			use: [{
				loader: 'file-loader',
				options: {
					name: '[name].[ext]?[hash]',
					outputPath: 'fonts/'
				}
			}]
		}]
	},

	resolve: {
		alias: {
			// 'vue$': 'vue/dist/vue.esm.js',
            'jquery': 'jquery/src/jquery'
		}
	},

	plugins: [
		new ExtractTextPlugin('[name].css'),
		// new webpack.optimize.UglifyJsPlugin({
		// 	minimize: env === 'production' ? true : false
		// }),
		new webpack.DefinePlugin({
			BUNDLED: true,
			VERSION: `'${version}'`,
			'process.env': {
				NODE_ENV: '"production"'
			}
		})
	]

};
