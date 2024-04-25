package com.ptit.controller.admin;


import com.ptit.Dto.PostDto;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Post;
import com.ptit.Entities.User;
import com.ptit.Service.CategoryService;
import com.ptit.Service.PostService;
import com.ptit.Service.StorageService;
import com.ptit.Service.UserService;
import jakarta.servlet.ServletContext;
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


    @Autowired
    private StorageService storageService;
    private PostService postService;
    private UserService userService;
    private CategoryService categoryService;

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

        for (Category cate : categories) {
            String username = cate.getCategoryName();
            System.out.println(username);
        }

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
                              @RequestParam("category") String selectedOption ,
                              @RequestParam("image") MultipartFile image
    ){

        try {
            UserDto currentUser = (UserDto) model.getAttribute("userdto");

            User user = userService.getUserByEmail(currentUser.getEmail().trim());
            postDto.setUser(user);

            Category cate = categoryService.getCategoryByIdCategory(Integer.parseInt(selectedOption));
            postDto.setCategory(cate);

            String filePath = storageService.store(image);
            filePath = getRelativePath(filePath);

            postService.save(postDto,filePath);
            System.out.println("them duoc cai lonnnnnnnnn");


        } catch (Exception e) {

            System.out.println("khong them duoc bai viet");
        }

        return "admin/postAdmin";
    }

    @PostMapping(value = "/post/delete", params = "action=delete")
    public String deletePost( @RequestParam("id") int idPost,Model model){

        int pageNum =1;
        System.out.println("id xoa la: " + idPost);
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

    @PostMapping(value = "/post/update", params = "action=update")
    public String updatePost(@RequestParam("id") int idPost){
        System.out.println("id cap nhat la: " + idPost);
        return "admin/postAdmin";
    }





}





