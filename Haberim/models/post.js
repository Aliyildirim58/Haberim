var mongoose = require('mongoose')
var Schema = mongoose.Schema

var postSchema = new Schema(
	{
		post_id: {
			type: mongoose.Schema.Types.ObjectId,
			unique: true,
			auto: true,
		},
		post_title: {
			type: String,
			required: true,
		},
		post_detail: {
			type: String,
			required: true,
		},
		post_city: {
			type: String,
			required: true,
		},
		post_category: {
			type: String,
			required: true,
		},
		post_img: {
			type: String,
			required: true,
		},
		post_likecount: {
			type: Number,
			default: 0,
		},
		post_dislikecount: {
			type: Number,
			default: 0,
		},
		post_complain: {
			type: Number,
			default: 0,
		},
		post_useremail: {
			type: String,
			required: true,
		},
	},
	{ timestamps: true },
)

// postSchema.pre('save',function(next){
//     var post = this;
//     if(this.isNew){
//     }
// })
//ctrlkc ctrlku
module.exports = mongoose.model('Post', postSchema)
