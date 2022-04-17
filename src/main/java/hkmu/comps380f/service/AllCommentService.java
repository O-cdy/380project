/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hkmu.comps380f.service;

import hkmu.comps380f.dao.AllCommentRepository;
import hkmu.comps380f.model.AllComment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AllCommentService {

    @Resource
    private AllCommentRepository allcomment;

    @Transactional
    public List<AllComment> getAllComments() {
        return allcomment.findAll();

    }
}
