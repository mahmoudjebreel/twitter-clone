<?php

require_once "backend/initialize.php";
if(Login::isLoggedIn()){
    $user_id=Login::isLoggedIn();
}else if(isset($_SESSION['userLoggedIn'])){
  $user_id=$_SESSION['userLoggedIn'];
  $verify->authOnly($user_id);
}else{
    redirect_to(url_for("index"));
}

if(is_get_request()){
    if(isset($_GET['username']) && !empty($_GET['username'])){
        $username=FormSanitizer::formSanitizerString($_GET['username']);
        $profileId=$loadFromUser->userIdByUsername($username);
        if(!$profileId){
            redirect_to(url_for("home"));
        }
        
    }else{
        $profileId=$user_id;
    }
}
$user=$loadFromUser->userData($user_id);
$notificationCount=$loadFromMessage->notificationCount($user_id);
$profileData=$loadFromUser->userData($profileId);
$date_joined=strtotime($profileData->signUpDate);
$pageTitle=$profileData->firstName.' '.$profileData->lastName.'(@'.$profileData->username.') / Twitter';
?>
<?php require_once 'backend/shared/header.php'; ?>
<div class="u-p-d" data-uid="<?php echo $user_id; ?>" data-pid="<?php echo $profileId; ?>"></div>
<?php require_once "backend/shared/nav_header.php"; ?>
 <main role="main">
       <?php require_once "backend/shared/profile_header.php"; ?>
       <div class="tabsContainer">
           <?php echo $loadFromTweet->createTab("Tweets",url_for($profileData->username),true); ?>
           <?php echo $loadFromTweet->createTab("Tweets & replies",url_for($profileData->username.'/replies'),false); ?>
       </div>
       <section aria-label="Timeline:Your Profile Timeline" class="profilePostsContainer">
        <?php $loadFromTweet->profileTweets($profileId,$user_id); ?>
       </section>
       <div id="popUpModal" class="retweet-modal-container">
       </div>
       <div class="reply-wrapper">
       </div>
       <?php require_once 'backend/shared/previewContainer.php'; ?>
       <div class="del-post-wrapper-container">
           <div class="del-post-wrapper">
              <div class="del-post-content">
                 <h2 class="del-post-content-header">Delete Tweet?</h2>
                 <p>This can’t be undone and it will be removed from your profile, the timeline of any accounts that follow you, and from Twitter search results.</p>
                 <div class="del-btn-wrapper">
                    <button class="del-btn" id="cancel" type="button">Cancel</button>
                    <button class="del-btn" id="delete-post-btn" type="button">Delete</button>
                 </div>
              </div>
           </div>
        </div>
    </section>
    <aside role="Complementary">Aside</aside>
 </main>
</section>
<script src="<?php echo url_for("frontend/assets/js/profile.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/notify.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/follow.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/delete.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/hashtag.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/retweet.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/reply.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/likeTweet.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/fetchTweet.js"); ?>"></script>
<script src="<?php echo url_for("frontend/assets/js/common.js"); ?>"></script>