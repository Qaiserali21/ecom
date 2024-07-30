<?php 
require('header.inc.php');
$categories= '';
$msg='';
if (isset($_GET['id'])  && $_GET['id']!='') {
    $id=get_safe_value($con, $_GET['id']);
    $res = mysqli_query($con, "SELECT * FROM categories where id='$id'");
    if (mysqli_num_rows($res)==0) {
        header("Location:categories.php");
        die();
    }
    $row=mysqli_fetch_assoc($res);
    $categories=$row['categories'];
}

if (isset($_POST['submit'])){
    $categories = get_safe_value($con, $_POST['categories']);
    $res = mysqli_query($con, "SELECT * FROM categories where categories='$categories'");
    $check = mysqli_num_rows($res);
    if ($check>0) {
        if (isset($_GET['id'])  && $_GET['id']!='') {
            $getdata = mysqli_fetch_assoc($res);
            if ($getdata['id']==$id) {
            }
            else{
                $msg = "Categories already exist";
            }
        }else{
            $msg = "Categories already exist";
        }
    }
    if ($msg == '') {
            if (isset($_GET['id'])  && $_GET['id']!='') {
                mysqli_query($con, "UPDATE categories set categories='$categories' WHERE id='$id'");
            }
            else {
                mysqli_query($con, "INSERT INTO categories(categories, status) values('$categories','1')");
            }
            header("Location:categories.php");
            die();
         }
    }
?>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Categories</strong><small>Form</small></div>
                        <form method="post">
                        <div class="card-body card-block">
                           <div class="form-group"><label for="company" class=" form-control-label">Categories</label>
                           <input type="text" name="categories" placeholder="Enter your Category name" class="form-control" required value="<?php echo $categories?>"></div>
                           <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
                           <span id="payment-button-amount">Submit</span>
                           </button>
                           <div class="field_error"> 
                            <?php echo $msg; ?>
                            </div>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
<?php
require('footer.inc.php');
?>