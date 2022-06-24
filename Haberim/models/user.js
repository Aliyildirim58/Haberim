var mongoose = require('mongoose')
var Schema =mongoose.Schema;
var bcrypt = require('bcrypt')

var userShema = new Schema({
    id: {
       type: mongoose.Schema.Types.ObjectId,
       index: true,
       required: true,
       auto: true,
       unique: true
    },
    name: {
        type: String,
        require: true
    },
    surname: {
        type: String,
        require: true
    },
    email:{
        type: String,
        required: true,
        unique: true
    },
    password: {
        type: String,
        required: true
    },
    post_count: {
        type: Number,
        default:0

    },
    total_view: {
        type: Number,
        default:0
    }
})

userShema.pre('save',function(next){
    var user = this;
    if(this.isModified('password') || this.isNew){
        bcrypt.genSalt(10,function(err,salt){
            if(err){
                return next(err)
            }
            bcrypt.hash(user.password,salt,function(err,hash){
                if(err){
                    return next(err)
                }
                user.password=hash;
                next()

            })
        })
    }
    else{
        return next()
    }
})
userShema.methods.comparePassword=function(passw,cb){
    bcrypt.compare(passw,this.password,function(err,isMatch){
        if(err){
            return cb(err)
        }
        else{
            cb(null,isMatch)
        }
    })
}

module.exports = mongoose.model('User',userShema)