$(function(){
    let uid=$(".u-p-d").data("uid");
    let win=$(window);
    let offset=10;
    // console.log(win);
    win.scroll(function(){
        let content_height=$(document).height();
        let content_y=win.height()+win.scrollTop();
        // console.log(content_y+"/"+content_height);

        if(content_height <= content_y){
            offset +=10;
            $.post("http://localhost/tweety/backend/ajax/fetchTweet.php",{fetchTweet:offset,userid:uid},function(data){
                $(".postContainer").html(data);
                
              })
        }
    })
})