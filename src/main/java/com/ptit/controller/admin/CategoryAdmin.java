package com.ptit.controller.admin;


import com.ptit.Dto.CategoryDto;
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
import jakarta.validation.Valid;
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
public class CategoryAdmin {

    private CategoryService categoryService;

    @ModelAttribute("userdto")
    public UserDto userDto(){
        return new UserDto();
    }

    @ModelAttribute("categorydto")
    public CategoryDto categoryDto(){
        return new CategoryDto();
    }

    @GetMapping("/category")
    public String Category(Model model){
        List<Category> categoryList = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute(categoryList);

        return "admin/categoryAdmin";
    }

    @GetMapping("/category/new-category")
    public String newPost(){


        return "admin/newCategory";
    }


    @PostMapping("/category/new-category")
    public String saveNewPost(Model model, @ModelAttribute("categorydto") CategoryDto categoryDto
    ){
        try {


            categoryService.save(categoryDto);


        } catch (Exception e) {
        }
        List<Category> categoryList = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute(categoryList);

        return "admin/categoryAdmin";
    }



    @PostMapping(value = "/category/delete", params = "action=delete")
    public String deletePost( @RequestParam("id") int IdCategory,Model model) {



       // Category category = categoryService.getCategoryByIdCategory(IdCategory);

        categoryService.delete(IdCategory);

        List<Category> categoryList = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute(categoryList);

        return "admin/categoryAdmin";

    }


    @GetMapping( "/category/update")
    public String updatePost(@RequestParam("id") int idCategory, Model model,  HttpSession session) {

        Category category = categoryService.getCategoryByIdCategory(idCategory);


        model.addAttribute("categoryName",category.getCategoryName());
        model.addAttribute("categoryDes",category.getDescribe());
        //model.addAttribute("idPost", idPost);

        session.setAttribute("idCategory", idCategory);

        return "admin/updateCategory";
    }

    @PostMapping("/category/update")
    public String saveUpdatePost( @ModelAttribute("idCategory") String idCategory, HttpSession session, Model model,
                                 @RequestParam("categoryName") String categoryName, @RequestParam("categoryDes") String categoryDes
         ) {
        int id = (int) session.getAttribute("idCategory");



        try {


            categoryService.update(categoryName, categoryDes, id);


        } catch (Exception e) {

        }

        List<Category> categoryList = categoryService.findAllByOrderByIdCategoryDesc();

        model.addAttribute(categoryList);

        return "admin/categoryAdmin";

    }



}
