<?php 
require('header.inc.php');
$categories_id= '';
$name='';
$mrp='';
$price='';
$qty='';
$image='';
$short_desc='';
$description='';
$meta_title='';
$meta_desc='';
$meta_keyword='';
$msg='';
$image_required='required';
if (isset($_GET['id'])  && $_GET['id']!='') {
    $image_required='';
    $id=get_safe_value($con, $_GET['id']);
    $res = mysqli_query($con, "SELECT * FROM product where id='$id'");
    $check = mysqli_num_rows($res);
    if ($check>0) {
        $row=mysqli_fetch_assoc($res);
        $categories_id=$row['categories_id'];
        $name=$row['name'];
        $mrp=$row['mrp'];
        $price=$row['price'];
        $qty=$row['qty'];
        $short_desc=$row['short_desc'];
        $description=$row['description'];
        $meta_title=$row['meta_title'];
        $meta_desc=$row['meta_desc'];
        $meta_keyword=$row['meta_keyword'];
    }
    else {
        header("Location:product.php");
        die();
    }
    
}

if (isset($_POST['submit'])){
    $categories_id = get_safe_value($con, $_POST['categories_id']);
    $name = get_safe_value($con, $_POST['name']);
    $mrp = get_safe_value($con, $_POST['mrp']);
    $price = get_safe_value($con, $_POST['price']);
    $qty = get_safe_value($con, $_POST['qty']);
    $short_desc = get_safe_value($con, $_POST['short_desc']);
    $description = get_safe_value($con, $_POST['description']);
    $meta_title = get_safe_value($con, $_POST['meta_title']);
    $meta_desc = get_safe_value($con, $_POST['meta_desc']);
    $meta_keyword = get_safe_value($con, $_POST['meta_keyword']);
    $res = mysqli_query($con, "SELECT * FROM product where name='$name'");
    $check = mysqli_num_rows($res);
    if ($check>0) {
        if (isset($_GET['id'])  && $_GET['id']!='') {
            $getdata = mysqli_fetch_assoc($res);
            if ($getdata['id']==$id) {
            }
            else{
                $msg = "product already exist";
            }
        }else{
            $msg = "product already exist";
        }
    }
    if ($msg == '') {
            if (isset($_GET['id'])  && $_GET['id']!='') {
                if ($_FILES['image']['name']!='') {
                    $image = rand(11111111, 9999999).'_'.$_FILES['image']['name'];
                    move_uploaded_file($_FILES['image']['tmp_name'],'./media/product/'. $image);
                    $update_sql = "UPDATE product set categories_id='$categories_id', name='$name', mrp='$mrp', price='$price', qty='$qty', short_desc='$short_desc', description='$description', meta_title='$meta_title', meta_desc='$meta_desc', meta_keyword='$meta_keyword', image='$image' WHERE id='$id'";
                }
                else {
                    $update_sql = "UPDATE product set categories_id='$categories_id', name='$name', mrp='$mrp', price='$price', qty='$qty', short_desc='$short_desc', description='$description', meta_title='$meta_title', meta_desc='$meta_desc', meta_keyword='$meta_keyword' WHERE id='$id'";
                }
                mysqli_query($con, $update_sql);
            }
            else {
                $image = rand(11111111, 9999999).'_'.$_FILES['image']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'],'./media/product/'. $image);
                mysqli_query($con, "INSERT INTO product(categories_id, name, mrp, price, qty, short_desc, description, meta_title, meta_desc, meta_keyword, image) values('$categories_id', '$name', '$mrp', '$price', '$qty', '$short_desc', '$description', '$meta_title', '$meta_desc','$meta_keyword', '$image')");
            }
            header("Location:product.php");
            die();
         }
    }
?>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product</strong><small>Form</small></div>
                        <form method="post" enctype="multipart/form-data">
                    <div class="card-body card-block">
                        <div class="form-group">
                            <label for="company" class=" form-control-label">Categories</label>
                           <select name="categories_id" class="form-control">
                            <option>Select Categories</option>
                            <?php
                            $res = mysqli_query($con, "select id,categories from categories order by categories asc");
                            while ($row=mysqli_fetch_assoc($res)) {

                                if ($row['id']==$categories_id) {
                                    echo "<option selected value=".$row['id'].">".$row['categories']."</option>";
                                }else{
                                     echo "<option value=".$row['id'].">".$row['categories']."</option>";
                                }
                               
                            }
                            ?>
                           </select>
                        
                            <div class="form-group">
                            <label for="company" class=" form-control-label mt-2">Product Name</label>
                            <input type="text" name="name" placeholder="Enter your product name" class="form-control" required value="<?php echo $name?>">
                            </div>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">MRP</label>
                            <input type="text" name="mrp" placeholder="Enter product mrp" class="form-control" required value="<?php echo $mrp?>">
                            </div>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Product Price</label>
                            <input type="text" name="price" placeholder="Enter product price" class="form-control" required value="<?php echo $price?>">
                            </div>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Product QTY</label>
                            <input type="text" name="qty" placeholder="Enter product qty" class="form-control" required value="<?php echo $qty?>">
                            </div>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Product image</label>
                            <input type="file" name="image" class="form-control" <?php echo $image_required?>>
                            </div>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Short Description</label>
                            <textarea name="short_desc" placeholder="Enter product short description" class="form-control" required><?php echo $short_desc?>
                            </textarea>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Description</label>
                            <textarea name="description" placeholder="Enter product description" class="form-control" required><?php echo $description?>
                            </textarea>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Meta Title</label>
                            <textarea name="meta_title" placeholder="Enter product meta title" class="form-control"><?php echo $meta_title?>
                            </textarea>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Meta Description</label>
                            <textarea name="meta_desc" placeholder="Enter product meta description" class="form-control"><?php echo $meta_desc?>
                            </textarea>

                            <div class="form-group">
                            <label for="company" class=" form-control-label ">Meta Keywords</label>
                            <textarea name="meta_keyword" placeholder="Enter product short description" class="form-control"><?php echo $meta_keyword?>
                            </textarea>

                           <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block mt-3">
                           <span id="payment-button-amount">Submit</span>
                           </button>
                           <div class="field_error"> 
                            <?php echo $msg; ?>
                            </div> 
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