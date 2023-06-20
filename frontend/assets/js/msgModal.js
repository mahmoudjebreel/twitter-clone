$(function(){
   
    const modal=document.querySelector(".popup-msg-container");

    $(document).on("click",".popup-msg-icon",function(){
        modal.style.display="none";
    });

    $(window).on("click",function(e){
    if(e.target==modal){
        modal.style.display="none";
    }
    });

    $(document).on("click",".h-ment",function(){
        let profileId=$(this).data("profileid");
        if(profileId !=undefined){
            window.location.href="http://localhost/tweety/messages/"+profileId;
        }
    });


});