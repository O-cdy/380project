/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hkmu.comps380f.service;

import hkmu.comps380f.dao.CommentRepository;
import hkmu.comps380f.model.Comment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CommentService {

    @Resource
    private CommentRepository commentRepo;

    @Transactional
    public List<Comment> getComments() {
        return commentRepo.findAll();
    }

    @Transactional
    public void storeComment(String username, String comment) {
        Comment newcomment = new Comment();
        newcomment.setUsername(username);
        newcomment.setComment(comment);
        commentRepo.save(newcomment);

    }

}
