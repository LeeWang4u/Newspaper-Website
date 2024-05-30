package com.ptit.controller.admin;


import com.ptit.Dto.PostDto;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Comment;
import com.ptit.Entities.Post;
import com.ptit.Entities.User;
import com.ptit.Service.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.io.File;

@Transactional
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
@SessionAttributes("userdto")
public class PostAdmin {

    //  public int index = 1;

    @Autowired
    private StorageService storageService;
    private PostService postService;
    private UserService userService;
    private CategoryService categoryService;
    private CommentService commentService;

    @ModelAttribute("userdto")
    public UserDto userDto(){
        return new UserDto();
    }
    @ModelAttribute("postdto")
    public PostDto postDto(){
        return new PostDto();
    }



    @GetMapping("/post/new-post")
    public String newPost(Model model){
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();
        model.addAttribute(categories);


        return "admin/newPost";
    }

    public static String getRelativePath(String fullPath) {
        int index = fullPath.indexOf("static");
        if (index != -1) {
            String relativePath = fullPath.substring(index + 7).replace("\\", "/");
            return "/" + relativePath;
        }
        return "";
    }



    @PostMapping("/post/new-post")
    public String saveNewPost(Model model, @ModelAttribute("postdto") PostDto postDto,
                              @RequestParam("category") String selectedOption
            ,@RequestParam("image") MultipartFile image
    ){
        try {
            UserDto currentUser = (UserDto) model.getAttribute("userdto");

            User user = userService.getUserByEmail(currentUser.getEmail().trim());
            postDto.setUser(user);

            Category cate = categoryService.getCategoryByIdCategory(Integer.parseInt(selectedOption));
            postDto.setCategory(cate);


            String filePath = storageService.store(image);
            filePath = getRelativePath(filePath);
            //   postDto.setImage(filePath);
            postService.save(postDto,filePath);


        } catch (Exception e) {

            System.out.println("khong them duoc bai viet");
        }
        int pageNum = 1;
        Page<Post> page = postService.findAllByOrderByIdPostDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<Post> listPost = page.getContent();
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listPost", listPost);
        model.addAttribute("categories",categories);
        return "admin/postAdmin";
//        return "admin/home";
    }



    @PostMapping(value = "/post/delete", params = "action=delete")
    public String deletePost( @RequestParam("id") int idPost,Model model){

        int pageNum =1;
        System.out.println("id xoa la: " + idPost);

        Post post = postService.getPostbyIdPost(idPost);
        List<Comment> comments = commentService.findByIdPostOrderByIdCmtDesc(post);
        for(Comment e:comments){
            commentService.delete(e);
        }


        postService.delete(idPost);

        Page<Post> page = postService.findAllByOrderByIdPostDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<Post> listPost = page.getContent();
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listPost", listPost);
        model.addAttribute("categories",categories);
        return "admin/postAdmin";
    }

/*
    @GetMapping(value = "/post/update", params = "action=update")
//@GetMapping( "/post/update")
//@PostMapping(value = "/post/update", params = "action=update")
    public String updatePost(Model model, //@RequestBody String data,
                             @RequestParam("id") int idPost
        ,@RequestParam("image") MultipartFile image
){
        System.out.println("id cap nhat la: " + idPost);
        //index = idPost;
        Post post = postService.getPostbyIdPost(idPost);
      //      Category category = categoryService.getCategoryByIdCategory(post.getIdCategory());
        System.out.println(post.getTitle());
        System.out.println(post.getContentPost());

        System.out.println(post.getImage());

        PostDto postDto = new PostDto();
        postDto.setTitle(post.getTitle());
        postDto.setContentPost(post.getContentPost());

    model.addAttribute("Title",post.getTitle());
    model.addAttribute("ContentPost",post.getContentPost());
    String filePath = storageService.store(image);
    filePath = getRelativePath(filePath);

    System.out.println(filePath);


    //data = post.getTitle();
        //model.addAttribute("data",data);
        //model.addAttribute("postDto",postDto);

       // System.out.println(post.getIdCategory());

//        model.addAttribute("title",post.getTitle());
//        model.addAttribute("contentPost",post.getContentPost());
//        model.addAttribute("image",post.getImage());
       // model.addAttribute("category",post.getIdCategory());

        return "admin/updatePost";
    }
    */
//    @GetMapping("/post/update/save/{idPost}")
//    public String update(Model model, @PathVariable(name = "idPost") int idPost){
//        Post post = postService.getPostbyIdPost(idPost);
//
//        model.addAttribute("Title",post.getTitle());
//        model.addAttribute("ContentPost",post.getContentPost());
//        return "admin/updatePost";
//
//    }
/*
    @PostMapping("/post/update/save/{idPost}")
    public String saveUpdate(//@ModelAttribute("postdto") PostDto postDto,
                            // @RequestParam("category") String selectedOption ,
                             @PathVariable(name = "idPost") int idPost,
                             @RequestParam("title") String title ,
                             @RequestParam("contentPost") String contentPost ,
                             @RequestParam("image") MultipartFile image){
        try {


//            Category cate = categoryService.getCategoryByIdCategory(Integer.parseInt(selectedOption));
//            postDto.setCategory(cate);

            String filePath = storageService.store(image);
            filePath = getRelativePath(filePath);
            System.out.println(filePath);
            System.out.println(title);

            //postService.save(postDto,filePath);
            System.out.println(idPost);


        } catch (Exception e) {

            System.out.println("khong them duoc bai viet");
        }
        return "admin/newPost";

    }
*/

   /*
//    @PostMapping(value = "/post/update", params = "action=update")
@PostMapping("/post/update")
    public String update(Model model, @RequestParam("id") int idPost,
                      //   @ModelAttribute("postdto") PostDto postDto, // @RequestParam("id") int idPost,
//            @RequestParam("title") String title ,
//    @RequestParam("contentPost") String contentPost ,
    @RequestParam("image") MultipartFile image){
        //PostDto postDto ;

      //  int idPost=index;
        String filePath ="";
        if (image.isEmpty()) {
            Post post = postService.getPostbyIdPost(idPost);
            filePath = post.getImage();
        }
        else{
            filePath = storageService.store(image);
            filePath = getRelativePath(filePath);
        }
      //  postService.update(title,contentPost,filePath,idPost);

        int pageNum =1;

        Page<Post> page = postService.findAllByOrderByIdPostDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<Post> listPost = page.getContent();
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listPost", listPost);
        model.addAttribute("categories",categories);
        return "admin/postAdmin";


    }
    */


    @GetMapping( "/post/update")
    public String updatePost(@RequestParam("id") int idPost, Model model,  HttpSession session) {

        Post post = postService.getPostbyIdPost(idPost);


        // System.out.println(post.getIdCategory());
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();
        model.addAttribute("categories",categories);
        model.addAttribute("Cate", post.getIdCategory().getCategoryName());
        model.addAttribute("Title",post.getTitle());
        model.addAttribute("ContentPost",post.getContentPost());
        //model.addAttribute("idPost", idPost);

        session.setAttribute("idPost", idPost);

        return "admin/updatePost";
    }

    @PostMapping("/post/update")
    public String saveUpdatePost(@ModelAttribute("idPost") String idPost,  HttpSession session,
                                 @RequestParam("title") String title, @RequestParam("contentPost") String contentPost
            ,@RequestParam("image") MultipartFile image, Model model,
                                 @RequestParam("category") String selectedOption ) {
        int id = (int) session.getAttribute("idPost");
        System.out.println(id);
        System.out.println(title);
        System.out.println(contentPost);


        try {


            String filePath ="";
            if (image.isEmpty()) {
                Post post = postService.getPostbyIdPost(id);
                filePath = post.getImage();
            }
            else{
                filePath = storageService.store(image);
                filePath = getRelativePath(filePath);
            };
            Category cate = categoryService.getCategoryByIdCategory(Integer.parseInt(selectedOption));



            //postService.save(postDto,filePath);
            postService.update(title,contentPost,filePath,cate,id);
            System.out.println(idPost);


        } catch (Exception e) {

            System.out.println("khong them duoc bai viet");
        }

        int pageNum = 1;
        Page<Post> page = postService.findAllByOrderByIdPostDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<Post> listPost = page.getContent();
        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listPost", listPost);
        model.addAttribute("categories",categories);
        return "admin/postAdmin";
    }



}