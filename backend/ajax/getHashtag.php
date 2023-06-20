<?php


require_once "../initialize.php";

if(is_post_request()){
    if(isset($_POST['hashtag']) && !empty($_POST['hashtag'])){
        $hashtag=FormSanitizer::formSanitizerString($_POST['hashtag']);
        $mention=FormSanitizer::formSanitizerString($_POST['hashtag']);
        
        
        if(substr($hashtag,0,1)==='#'){
            $trend=str_replace('#','',$hashtag);
            $trends=$loadFromTweet->getTrendByHash($trend);
            foreach($trends as $hashtag){
                echo '<li role="option" aria-selected="true">
                <div role="button" tabindex="0" data-focusable="true" class="getValue h-ment">#'.$hashtag->hashtag.'</div>
                </li>';
            }
        }

        
        if(substr($mention,0,1)==='@'){
            $mention_user=str_replace('@','',$mention);
            $mentions=$loadFromTweet->getMention($mention_user);
            foreach($mentions as $mention){
                echo '<li role="option" aria-selected="true">
                        <div role="button" tabindex="0" data-focusable="true" class="h-ment">
                        <div class="ment-w-container">
                            <div class="profile-user-icon">
                                <div class="profile-user-wrapper">
                                    <svg class="p-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g><path d="M12.225 12.165c-1.356 0-2.872-.15-3.84-1.256-.814-.93-1.077-2.368-.805-4.392.38-2.826 2.116-4.513 4.646-4.513s4.267 1.687 4.646 4.513c.272 2.024.008 3.46-.806 4.392-.97 1.106-2.485 1.255-3.84 1.255zm5.849 9.85H6.376c-.663 0-1.25-.28-1.65-.786-.422-.534-.576-1.27-.41-1.968.834-3.53 4.086-5.997 7.908-5.997s7.074 2.466 7.91 5.997c.164.698.01 1.434-.412 1.967-.4.505-.985.785-1.648.785z"/></g></svg>
                                </div>
                                <div class="f-follow">
                                    Follow
                                </div>
                            </div>
                            <div class="ment-profile-wrapper">
                                <div class="ment-profile-pic">
                                    <img src="'.url_for($mention->profileImage).'" alt="'.$mention->firstName.' '.$mention->lastName.'">
                                </div>
                                <div class="ment-profile-name">
                                    <div class="ment-user-fullName">
                                        <span class="ment-user-fullName-text">'.$mention->firstName.' '.$mention->lastName.'</span>
                                    </div>
                                    <div class="ment-user-username">
                                        <span class="ment-user-username-text getValue">@'.$mention->username.'</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
             </li> 
                ';
            }
        }



    }
}



?>