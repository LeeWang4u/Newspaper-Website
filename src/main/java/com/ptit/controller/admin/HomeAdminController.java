package com.ptit.controller.admin;

import com.ptit.Dto.PostDto;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Comment;
import com.ptit.Entities.Post;
import com.ptit.Entities.User;
import com.ptit.Service.*;
import jakarta.servlet.ServletContext;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.io.File;

@Controller
@RequestMapping("/admin")
@AllArgsConstructor
@SessionAttributes("userdto")
public class HomeAdminController {


    private ServletContext context;
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

     @GetMapping("/home")
    public String Home(){return "admin/home";}
    @GetMapping("/post/{pageNum}")
    public String Post(Model model,
                       @PathVariable(name = "pageNum") int pageNum){

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

        return "admin/postAdmin";}

    @GetMapping("/userAdmin/page/{pageNum}")
    public String User(Model model,@PathVariable(name = "pageNum") int pageNum ){
        Page<User> page = userService.findAllByOrderByEmailDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<User> listUser = page.getContent();
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listUser", listUser);
        return "admin/userAdmin";
    }
    @PostMapping("userAdmin/page/{pageNum}")
    public String UserDelete(Model model,@PathVariable(name = "pageNum") int pageNum,@RequestParam("email") String email ){
        User user = userService.getUserByEmail(email);
        UserDto currentUser = (UserDto) model.getAttribute("userdto");
        if(!user.getEmail().trim().equals(currentUser.getEmail().trim()) ){

            List<Comment> comments = commentService.findByEmailOrderByIdCmtDesc(user);
            System.out.println(comments);
            for(Comment cmt : comments){
                commentService.delete(cmt);
            }
            userService.delete(user);

        }
        Page<User> page = userService.findAllByOrderByEmailDesc(pageNum);
        int totalItems =page.getNumberOfElements() ;
        int totalPages= page.getTotalPages();
        List<User> listUser = page.getContent();
        model.addAttribute("currentPage", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems",totalItems);
        model.addAttribute("listUser", listUser);
        if(user.getEmail().trim().equals(currentUser.getEmail().trim()) ){
            return "redirect:/admin/userAdmin/page/1?wrong";
        }
        return "admin/userAdmin";
    }

//    @GetMapping("/post/new-post")
//    public String newPost(Model model){
//        System.out.println("vi sao khong duocccc");
//        List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();
//        model.addAttribute(categories);
//
//
//
//        for (Category cate : categories) {
//            String username = cate.getCategoryName();
//            System.out.println(username);
//        }
//
//
//        return "admin/newPost";
//    }
//
//    public static String getRelativePath(String fullPath) {
//        int index = fullPath.indexOf("static");
//        if (index != -1) {
//            return fullPath.substring(index).replace("\\", "/");
//        }
//        return "";
//    }
//
//    @PostMapping("/post/new-post")
//    public String saveNewPost(Model model, @ModelAttribute("postdto") PostDto postDto,
//                              @RequestParam("category") String selectedOption ,
//                              @RequestParam("image") MultipartFile image
//            ){
//
//
//                try {
//                    UserDto currentUser = (UserDto) model.getAttribute("userdto");
//
//                    User user = userService.getUserByEmail(currentUser.getEmail().trim());
//                    postDto.setUser(user);
//
//                    Category cate = categoryService.getCategoryByIdCategory(Integer.parseInt(selectedOption));
//                    postDto.setCategory(cate);
//
//                    String filePath = storageService.store(image);
//                    filePath = getRelativePath(filePath);
//
//                    postService.save(postDto,filePath);
//                    System.out.println("them duoc cai lonnnnnnnnn");
//
//
//        } catch (Exception e) {
//
//            System.out.println("khong them duoc bai viet");
//        }
//
//        return "admin/home";
//    }




}



