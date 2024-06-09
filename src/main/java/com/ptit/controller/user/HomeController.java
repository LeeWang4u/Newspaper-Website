package com.ptit.controller.user;

import com.ptit.Dto.CommentDto;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Comment;
import com.ptit.Entities.Post;
import com.ptit.Service.CategoryService;
import com.ptit.Service.CommentService;
import com.ptit.Service.PostService;
import com.ptit.Service.UserService;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@Controller
@RequestMapping("/user")
@AllArgsConstructor
@SessionAttributes("userdto")
public class HomeController {
	private PostService postService;
	private CommentService commentService;
	private UserService userService;
	private CategoryService categoryService;
	@ModelAttribute("userdto")
	public UserDto userDto(){
		return new UserDto();
	}
	@ModelAttribute("cmtdto")
	public CommentDto cmtDto(){
		return new CommentDto();
	}
	@GetMapping("/post" )
	public String post(@RequestParam("idPost") int idPost,Model model) {
		Post post = postService.getPostbyIdPost(idPost);
		List<Comment> cmt = commentService.findByIdPostOrderByIdCmtDesc(post);
		model.addAttribute("post",post);
		model.addAttribute("cmt",cmt);
		return "user/post";
	}
	@PostMapping("/post/{titlePost}")
	public String viewPost(@Valid @ModelAttribute("cmtdto") CommentDto commentDto, BindingResult bindingResult, @PathVariable(name = "titlePost") String titlePost, @RequestParam("idPost") int idPost, @RequestParam("idCmt") int idCmt, Model model){
		if (bindingResult.hasErrors()) {
			Post post = postService.getPostbyIdPost(idPost);
			List<Comment> cmt = commentService.findByIdPostOrderByIdCmtDesc(post);
			model.addAttribute("post",post);
			model.addAttribute("cmt",cmt);
			return "user/post";
		}
		Post post = postService.getPostbyIdPost(idPost);
		UserDto currentUser = (UserDto) model.getAttribute("userdto");
		if(commentDto.getContentCmt()!=null && currentUser.getEmail()!=null) {
			commentDto.setPost(postService.getPostbyIdPost(post.getIdPost()));
			commentDto.setUser(userService.getUserByEmail(currentUser.getEmail()));
			commentService.save(commentDto);
			commentDto.setContentCmt(null);
		}
		if(idCmt>0){
			Comment comment = commentService.getCommentByIdCmt(idCmt);
			commentService.delete(comment);


		}
		List<Comment> cmt = commentService.findByIdPostOrderByIdCmtDesc(post);
		List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();
		model.addAttribute("post",post);
		model.addAttribute("cmt",cmt);
		model.addAttribute("categories",categories);

		//return "redirect:/user/post?" + encodedTitle;
		return "user/post";
	}
	@GetMapping("/home/page/{pageNum}")
	public String viewPage(Model model,
						   @PathVariable(name = "pageNum") int pageNum) {
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


		return "user/home";
	}
	@GetMapping("/home/category/{categoryName}/{pageNum}")
	public String viewCategoryPage(Model model,
								   @PathVariable(name = "pageNum") int pageNum , @PathVariable(name = "categoryName") String categoryName) {
		Category category = categoryService.getCategoryByCategoryName(categoryName);

		Page<Post> page = postService.findByIdCategoryOrderByIdPostDesc(pageNum,category);
		int totalItems =page.getNumberOfElements() ;
		int totalPages = page.getTotalPages();
		List<Post> listPost = page.getContent();
		List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();

		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems",totalItems);
		model.addAttribute("listPost", listPost);
		model.addAttribute("categories",categories);
		model.addAttribute("cate",category);



		return "user/category";
	}
	@PostMapping("/search/{pageNum}")
	public String searchKey(Model model,@RequestParam(name = "keyWord") String keyWord,@PathVariable(name = "pageNum") int pageNum){
		if(keyWord.isEmpty()){
			return "redirect:/user/home/page/1";
		}
		Page<Post> page = postService.findByKeyword(keyWord,pageNum);
		int totalItems = page.getNumberOfElements();
		int totalPages = page.getTotalPages();
		List<Post> listPost  = page.getContent();
		List<Category> categories = categoryService.findAllByOrderByIdCategoryDesc();
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("totalItems",totalItems);
		model.addAttribute("listPost", listPost);
		model.addAttribute("categories",categories);
		model.addAttribute("keyWord",keyWord);
		return "user/search";
	}
}

