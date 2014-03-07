<?php

namespace FabioMora\Bundle\WebBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('FabioMoraWebBundle:Default:index.html.twig');
    }
}
