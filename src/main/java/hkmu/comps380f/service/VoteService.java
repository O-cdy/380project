package hkmu.comps380f.service;

import hkmu.comps380f.dao.VoteMcRepository;
import hkmu.comps380f.dao.VoteRepository;
import hkmu.comps380f.model.Vote;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VoteService {
    @Resource
    private VoteRepository vote;
    @Resource
    private VoteMcRepository votemc;
    @Transactional
    public List<Vote> listallvote(){
        return vote.findAll();
    }






}
